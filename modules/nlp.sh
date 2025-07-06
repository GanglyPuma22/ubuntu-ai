#!/bin/bash
echo "🧠 Installing NLP module..."


# Redirect model cache to ./models folder
export PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export HF_HOME=$PROJECT_ROOT/models/huggingface
export TRANSFORMERS_CACHE=$HF_HOME/transformers
export TORCH_HOME=$PROJECT_ROOT/models/torch

conda activate ai
pip install transformers datasets sentence-transformers

python3 - <<EOF
from transformers import AutoModel, AutoTokenizer
AutoModel.from_pretrained("distilbert-base-uncased")
AutoTokenizer.from_pretrained("distilbert-base-uncased")
EOF

echo "✅ NLP module installed."
