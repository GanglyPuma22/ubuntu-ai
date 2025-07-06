#!/bin/bash
echo "Installing NLP module..."

pip install transformers datasets sentence-transformers

python3 - <<EOF
from transformers import AutoModel, AutoTokenizer
AutoModel.from_pretrained("distilbert-base-uncased")
AutoTokenizer.from_pretrained("distilbert-base-uncased")
EOF

echo "NLP module installed."
