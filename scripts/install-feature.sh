#!/bin/bash

FEATURE=$1

case "$FEATURE" in
  --nlp)
    bash "$(dirname "$0")/../modules/nlp.sh"
    ;;
  --vision)
    bash "$(dirname "$0")/../modules/vision.sh"
    ;;
  --llm)
    bash "$(dirname "$0")/../modules/llm.sh"
    ;;
  *)
    echo "Usage: install-feature [--nlp|--vision|--llm]"
    ;;
esac
