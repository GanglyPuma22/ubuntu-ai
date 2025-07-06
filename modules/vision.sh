#!/bin/bash
echo "🖼️ Installing Vision module..."


# Redirect model cache to ./models folder
export PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export HF_HOME=$PROJECT_ROOT/models/huggingface
export TRANSFORMERS_CACHE=$HF_HOME/transformers
export TORCH_HOME=$PROJECT_ROOT/models/torch

conda activate ai
pip install torchvision

python3 - <<EOF
from torchvision.models import resnet18
resnet18(pretrained=True)
EOF

echo "✅ Vision module installed."
