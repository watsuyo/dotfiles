#!/bin/bash

set -e

echo "Starting Dotfiles Setup..."

# 1. Homebrew Installation
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2. Install Packages from Brewfile
echo "Installing packages from Brewfile..."
brew bundle --file=~/dotfiles/Brewfile

# 3. Dropbox Synchronization Check
echo "Checking for Dropbox directories..."
while [ ! -d "$HOME/Dropbox/nvim" ]; do
  echo "Waiting for Dropbox sync... (Please sign in to Dropbox and wait for folders to appear)"
  sleep 15
done
echo "Dropbox directories found."

# 4. Create Symbolic Links
echo "Creating symbolic links..."
mkdir -p ~/.config

# Configuration from Dropbox
ln -sfn ~/Dropbox/nvim ~/.config/nvim
ln -sfn ~/Dropbox/ghostty ~/.config/ghostty
ln -sfn ~/Dropbox/mise ~/.config/mise
ln -sfn ~/Dropbox/starship/starship.toml ~/.config/starship.toml
ln -sfn ~/Dropbox/karabiner ~/.config/karabiner

# Configuration from dotfiles repo
ln -sfn ~/dotfiles/.gitconfig ~/.gitconfig

# 5. Link Shell Configuration
echo "Linking .zshrc..."
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    echo "Backing up existing .zshrc to .zshrc.bak"
    mv ~/.zshrc ~/.zshrc.bak
fi
ln -sfn ~/dotfiles/.zshrc ~/.zshrc

# 6. Mise Tool Setup
echo "Setting up mise tools..."
if command -v mise &> /dev/null; then
    eval "$(mise activate bash)"
    
    mise install 
    
    echo "Installing Claude Code CLI..."
    mise use -g npm:@anthropic-ai/claude-code

    echo "Installing Claude Code Router..."
    mise use -g npm:@musistudio/claude-code-router
else
    echo "Error: mise not found."
    exit 1
fi
echo "---"
echo "Setup complete! Please restart your terminal."

