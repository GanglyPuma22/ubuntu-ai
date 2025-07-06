#!/bin/bash
set -e

FEATURE=$1

if [ -z "$UBUNTU_AI_HOME" ]; then
  echo "UBUNTU_AI_HOME not set. Please run setup-ai.sh first from project root or restart your terminal."
  exit 1
fi

# Redirect model cache to ./models folder
export HF_HOME=$UBUNTU_AI_HOME/models/huggingface
export TRANSFORMERS_CACHE=$HF_HOME/transformers
export TORCH_HOME=$UBUNTU_AI_HOME/models/torch

# Source conda shell functions
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
  source "$HOME/miniconda3/etc/profile.d/conda.sh"
else
  echo "Conda shell integration not found. Is Miniconda installed?"
  exit 1
fi

#Activate the AI conda environment so all sub scripts that install models do so in the same environment
conda activate ai

case "$FEATURE" in
  --nlp)
    bash "$(dirname "$0")/../modules/nlp.sh"
    ;;
  --vision)
    bash "$(dirname "$0")/../modules/vision.sh"
    ;;
  --llm)
    bash "$(dirname "$0")/../modules/llm.sh"
    ;;
  *)
    echo "Usage: install-feature [--nlp|--vision|--llm]"
    ;;
esac
