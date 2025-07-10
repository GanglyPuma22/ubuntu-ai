#!/bin/bash
set -e

#Check if user's logged in to Hugging Face
source "$UBUNTU_AI_HOME/utils/huggingface_token.sh"
export HF_TOKEN=$(get_hf_token)

#TODO Investigate checking model is gated before install especially if we are supporting a ton
# check_model_access() {
#   local model_id="$1"
#   local status=$(python3 "$PROJECT_HOME/scripts/check_gated_model.py" "$model_id")
#   if [[ "$status" == "GATED" ]]; then
#     echo "❗ The model '$model_id' is gated and requires Hugging Face authentication."
#     return 1
#   elif [[ "$status" == "UNKNOWN" ]]; then
#     echo "⚠️ Could not determine model access."
#     return 2
#   fi
#   return 0
# }

echo "Installing LLM module..."

MODEL_ID="mistralai/Mistral-7B-v0.1"

pip install transformers accelerate bitsandbytes

python3 - <<EOF
from transformers import AutoModelForCausalLM, AutoTokenizer

# api = HfApi()
# is_model_gated = None
# try:
#     model_info = api.model_info(model_id)
#     is_model_gated = model_info.gated
# except HfHubHTTPError as e:
#     if e.response.status_code == 401:
#         is_model_gated = True  # requires auth
#     elif e.response.status_code == 404:
#         print(f"Model '{model_id}' not found.")
#         is_model_gated = None
#     else:
#         raise
# print(f"Model '{model_id}' is gated: {is_model_gated}")
AutoModelForCausalLM.from_pretrained("$MODEL_ID")
AutoTokenizer.from_pretrained("$MODEL_ID")
EOF

echo "LLM module installed."