#!/bin/bash

set -e

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

sudo apt install -y nodejs git

curl -fsSL https://bun.sh/install | bash

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [ ! -d "$HOME/openclaude" ]; then
    git clone https://github.com/Gitlawb/openclaude.git
fi

cd "$HOME/openclaude"

npm install
npm run build
sudo npm link

openclaude --help

echo "OpenClaude installed successfully."