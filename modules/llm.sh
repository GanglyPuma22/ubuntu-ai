#!/bin/bash
echo "🤖 Installing LLM module..."


# Redirect model cache to ./models folder
export PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export HF_HOME=$PROJECT_ROOT/models/huggingface
export TRANSFORMERS_CACHE=$HF_HOME/transformers
export TORCH_HOME=$PROJECT_ROOT/models/torch

conda activate ai
pip install transformers accelerate bitsandbytes

python3 - <<EOF
from transformers import AutoModelForCausalLM, AutoTokenizer
AutoModelForCausalLM.from_pretrained("mistralai/Mistral-7B-Instruct-v0.1")
AutoTokenizer.from_pretrained("mistralai/Mistral-7B-Instruct-v0.1")
EOF

echo "✅ LLM module installed."
