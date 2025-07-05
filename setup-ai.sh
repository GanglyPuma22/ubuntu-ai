#!/bin/bash
set -e

if [ ! -d "$HOME/miniconda3" ]; then
  echo "Installing Miniconda..."
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
  bash miniconda.sh -b -p $HOME/miniconda3
  echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
fi

echo "Creating AI conda environment..."
conda env create -f ai-env.yml || echo "Environment may already exist."
conda init bash
source ~/.bashrc
echo "Setup complete. Run: conda activate ai"
