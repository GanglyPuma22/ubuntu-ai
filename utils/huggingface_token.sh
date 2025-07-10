#!/bin/bash

get_hf_token() {
    if [[ -n "$HF_TOKEN" ]]; then
        echo "Found HF_TOKEN in environment variable."
    elif [[ -f "$HOME/.cache/huggingface/token" ]]; then
        cat "$HOME/.cache/huggingface/token"
    else
        echo "WARNING Hugging Face token not found. Certain models need authentication to be downlaoded. Please run 'huggingface-cli login'" >&2
    fi
}
