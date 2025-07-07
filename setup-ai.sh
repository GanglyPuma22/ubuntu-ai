#!/bin/bash
set -e

# Set UBUNTU_AI_HOME to the current directory
# Assume the script is run from the project root
export UBUNTU_AI_HOME="$(pwd)"
export UBUNTU_AI_CONFIG_HOME="$UBUNTU_AI_HOME/config"

# Add UBUNTU_AI_HOME and UBUNTU_AI_CONFIG_HOME to ~/.bashrc if not already present
if ! grep -q 'export UBUNTU_AI_HOME=' ~/.bashrc; then
  echo "" >> ~/.bashrc
  echo "# Set ubuntu-ai distro project root" >> ~/.bashrc
  echo "export UBUNTU_AI_HOME=\"$UBUNTU_AI_HOME\"" >> ~/.bashrc
  echo "export UBUNTU_AI_CONFIG_HOME=\"$UBUNTU_AI_CONFIG_HOME\"" >> ~/.bashrc
  echo "Added UBUNTU_AI_HOME and UBUNTU_AI_CONFIG_HOME to ~/.bashrc"
else
  echo "UBUNTU_AI_HOME already defined in ~/.bashrc"
fi

# Create model cache directory structure
echo "Creating model cache directories..."
mkdir -p ./models/huggingface/transformers
mkdir -p ./models/torch/hub/checkpoints

echo ""
read -p "Install the recommended cli tools? Inspect config/base-packages.txt for details [Y/n] " install_cli
if [[ "$install_cli" =~ ^[Yy]$ || -z "$install_cli" ]]; then
  echo "Installing base CLI tools..."
  bash "$UBUNTU_AI_HOME/scripts/install-tools.sh"
else
  echo "Skipping CLI tools installation. You can run './scripts/install-tools.sh' (-i for interactivity) later to install the recommended tools."
  echo "WARNING: Some scripts may require these tools to function properly."
fi

#Conda install automatically handles bashrc update to source conda on shell startup
if [ ! -d "$HOME/miniconda3" ]; then
  echo "Installing Miniconda..."
  INSTALLER_PATH="/tmp/miniconda.sh"
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O "$INSTALLER_PATH"
  bash "$INSTALLER_PATH" -b -p "$HOME/miniconda3"
  rm "$INSTALLER_PATH"
  ~/miniconda3/bin/conda init bash
fi

echo "Creating AI conda environment..."
#Source conda to ensure the command is available
source "$HOME/miniconda3/etc/profile.d/conda.sh"
conda env create -f "$UBUNTU_AI_CONFIG_HOME/ai-env.yml" || echo "Environment may already exist."
conda init bash

#After initializing conda, ask user if they want to auto-activate the 'ai' environment by adding it to bashrc
read -p "Auto-activate the 'ai' Conda environment in future terminals? [Y/n] " auto_activate
if [[ "$auto_activate" =~ ^[Yy]$ || -z "$auto_activate" ]]; then
  # Auto-activate 'ai' conda env in new terminals
  if ! grep -q 'conda activate ai' ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# Auto-activate ai environment for AI distro" >> ~/.bashrc
    echo "conda activate ai" >> ~/.bashrc
    echo "Added auto-activation of 'ai' env to ~/.bashrc"
  else
    echo "'ai' env auto-activation already present in ~/.bashrc"
  fi

else
  echo "Skipping auto-activation of 'ai' environment in new terminals."
  echo "Be careful to activate it manually with 'conda activate ai' when needed."
fi

conda activate ai
echo "Setup complete!"
echo "Conda ai environment is now active."