#!/bin/bash
set -e

echo "Installing LLM module..."

pip install transformers accelerate bitsandbytes

python3 - <<EOF
from transformers import AutoModelForCausalLM, AutoTokenizer
AutoModelForCausalLM.from_pretrained("mistralai/Mistral-7B-Instruct-v0.1")
AutoTokenizer.from_pretrained("mistralai/Mistral-7B-Instruct-v0.1")
EOF

echo "LLM module installed."