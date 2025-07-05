#!/bin/bash
set -e

if [ ! -d "$HOME/miniconda3" ]; then
  echo "Installing Miniconda..."
  INSTALLER_PATH="/tmp/miniconda.sh"
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O "$INSTALLER_PATH"
  bash "$INSTALLER_PATH" -b -p "$HOME/miniconda3"
  rm "$INSTALLER_PATH"
  #echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.bashrc
  ~/miniconda3/bin/conda init bash
fi

# Create model cache directory structure
echo "Creating model cache directories..."
mkdir -p ./models/huggingface/transformers
mkdir -p ./models/torch/hub/checkpoint

echo "Creating AI conda environment..."
#Source conda to ensure the command is available
source "$HOME/miniconda3/etc/profile.d/conda.sh"
conda env create -f ai-env.yml || echo "Environment may already exist."
conda init bash
source ~/.bashrc
echo "Setup complete. Run: conda activate ai"