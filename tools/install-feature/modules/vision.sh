#!/bin/bash
set -e

echo "Installing Vision module..."

pip install torchvision

# Note: Python below downloads weights but avoids instantiating full model
python3 - <<EOF
from torchvision.models import resnet18, ResNet18_Weights
weights = ResNet18_Weights.DEFAULT
weights.get_state_dict(progress=True)
EOF

echo "Vision module installed."
