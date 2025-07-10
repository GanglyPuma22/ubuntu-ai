#!/bin/bash
set -e

#Check if user's logged in to Hugging Face
source "$UBUNTU_AI_HOME/utils/huggingface_token.sh"
export HF_TOKEN=$(get_hf_token)

echo "Installing LLM module..."

#Tokenizer included with this model
MODEL_ID="mistralai/Mistral-7B-v0.1"

pip install transformers accelerate bitsandbytes

#Note: Even when using snapshot_download(), large models like Mistral-7B will still require ~9GB of disk space to cache. 
#This avoids memory crashes since its not loading weights into RAM but not download/storage requirements.
python3 - <<EOF
from huggingface_hub import snapshot_download
snapshot_download("$MODEL_ID")

# AutoModelForCausalLM.from_pretrained("$MODEL_ID")
# AutoTokenizer.from_pretrained("$MODEL_ID")
EOF

echo "LLM module installed."