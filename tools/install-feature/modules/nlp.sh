#!/bin/bash
set -e

echo "Installing NLP module..."

#Tokenizer included with this model
MODEL_ID="distilbert-base-uncased"

pip install transformers datasets sentence-transformers

python3 - <<EOF
from huggingface_hub import snapshot_download
snapshot_download("$MODEL_ID")
EOF

echo "NLP module installed."
