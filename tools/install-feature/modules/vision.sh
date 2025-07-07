#!/bin/bash
set -e

echo "Installing Vision module..."

pip install torchvision

#TODO Have options for pretrained vs no pretrained weights?s
python3 - <<EOF
from torchvision.models import resnet18, ResNet18_Weights
# Load model with pretrained weights
resnet18(weights=ResNet18_Weights.DEFAULT)
EOF

echo "Vision module installed."
