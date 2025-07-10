#!/bin/bash
set -e

MODELS_DIR="$UBUNTU_AI_HOME/models"

HF_HUB_HOME="$MODELS_DIR/huggingface/hub"
HF_TRANFORMERS_HOME="$MODELS_DIR/huggingface/transformers"
TORCH_HUB_HOME="$MODELS_DIR/torch/hub/"

DELETED_MODELS=()
FREED_SPACE=0

print_line() {
  echo "----------------------------------------"
}

# Function to get disk space (in KB)
get_disk_usage_kb() {
  du -sk "$MODELS_DIR" | awk '{print $1}'
}

# Show model directory structure
echo "Checking for downloaded models in: $MODELS_DIR"
print_line

if [ ! -d "$MODELS_DIR" ]; then
  echo "No models directory found. Nothing to clean."
  exit 0
fi

echo "Following huggingface models found in transformers dir:"
if [ -d "$HF_TRANFORMERS_HOME" ]; then
  tree -d "$HF_TRANFORMERS_HOME"
fi
print_line

echo "Following huggingface models found in hub dir:"
if [ -d "$HF_HUB_HOME" ]; then
  tree -d "$HF_HUB_HOME"
fi
print_line

echo "Following torch models found in hub dir:"
if [ -d "$TORCH_HUB_HOME" ]; then
  tree "$TORCH_HUB_HOME"
fi

print_line
du -hs "$MODELS_DIR"
read -p "Are you sure you want to delete all models under '$MODELS_DIR'? [y/N] " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
  echo "Aborted by user."
  exit 0
fi

# Disk usage before cleanup
before_kb=$(get_disk_usage_kb)

# Delete all model subfolders
echo "Deleting models..."
rm -rf "$HF_TRANFORMERS_HOME"/* "$HF_HUB_HOME"/* "$TORCH_HUB_HOME"/*
echo "Deleting hidden files associated with models..." 
rm -rf "$HF_TRANFORMERS_HOME"/.* "$HF_HUB_HOME"/.* "$TORCH_HUB_HOME"/.*
echo "Deleting huggingface xet chunks..."
rm -rf "$UBUNTU_AI_HOME/models/huggingface/xet"

# Disk usage after cleanup
after_kb=$(get_disk_usage_kb)
FREED_SPACE=$((before_kb - after_kb))

print_line
freed_mb=$(awk "BEGIN {printf \"%.2f\", $FREED_SPACE/1024}")
echo "Disk space freed: ${freed_mb} MB"
print_line
