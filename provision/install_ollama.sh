#!/bin/bash

set -e

curl -fsSL https://ollama.com/install.sh | sh

sleep 5

ollama --version

ollama pull qwen2.5-coder:7b

echo "Ollama installed successfully."