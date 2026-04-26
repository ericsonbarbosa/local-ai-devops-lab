#!/bin/bash

set -e

if ! grep -q "CLAUDE_CODE_USE_OPENAI" ~/.bashrc; then
cat <<EOF >> ~/.bashrc

export CLAUDE_CODE_USE_OPENAI=1
export OPENAI_BASE_URL="http://localhost:11434/v1"
export OPENAI_API_KEY="ollama"
export OPENAI_MODEL="qwen2.5-coder:7b"

EOF
fi

echo "Environment variables configured successfully."