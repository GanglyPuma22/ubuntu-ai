#!/bin/bash


# Redirect model cache to ./models folder
export PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export HF_HOME=$PROJECT_ROOT/models/huggingface
export TRANSFORMERS_CACHE=$HF_HOME/transformers
export TORCH_HOME=$PROJECT_ROOT/models/torch


TYPE=$1
MODEL=$2

if [[ -z "$TYPE" || -z "$MODEL" ]]; then
  echo "Usage: load-model --type=[chat|vision|embed] model_name"
  exit 1
fi

echo "Downloading $MODEL for $TYPE..."

conda activate ai

case "$TYPE" in
  chat)
    python3 -c "from transformers import AutoModelForCausalLM, AutoTokenizer; AutoModelForCausalLM.from_pretrained('$MODEL'); AutoTokenizer.from_pretrained('$MODEL')"
    ;;
  vision)
    python3 -c "from torchvision.models import resnet18; resnet18(pretrained=True)"
    ;;
  embed)
    python3 -c "from sentence_transformers import SentenceTransformer; SentenceTransformer('$MODEL')"
    ;;
  *)
    echo "❌ Unknown type: $TYPE"
    exit 1
    ;;
esac

echo "Model $MODEL downloaded and cached."
