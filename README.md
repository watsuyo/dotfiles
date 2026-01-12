# dotfiles

These dotfiles are managed in ~/dotfiles and synced via Dropbox for configuration management across multiple systems.

---

## Setup

Follow these steps to bootstrap a fresh macOS installation.

### 1. Install Xcode Command Line Tools

Run the following command in your terminal and follow the system prompts.

```bash
xcode-select --install

```

### 2. Clone the Repository

Ensure the repository is placed in ~/dotfiles

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles

```

### 3. Run the Bootstrap Script

Make the script executable and run it to install dependencies and create links.

```bash
chmod +x shell/setup.sh
./shell/setup.sh

```

---

## Configuration Details

### Brewfile

The Brewfile handles all system dependencies including CLI tools like mise and neovim, and GUI applications like Dropbox and Ghostty. It also includes the official Claude CLI.

### Setup Script

The setup script automates the following workflow.

1. Homebrew: Installs the manager and all packages defined in the Brewfile.
2. Dropbox Sync: Pauses until the ~/Dropbox/nvim directory is detected, ensuring your configurations are downloaded.
3. Symbolic Links: Creates links from Dropbox and the dotfiles folder to your local system.
4. Mise Tool Setup: Initializes mise and installs the Claude Code Router (ccr) via npm.

---

## Personal Secrets

The shell configuration sources a local file for sensitive environment variables such as API tokens. This file is excluded from version control.

```bash
touch ~/.zshrc.local
echo 'export GITHUB_TOKEN="your-token-here"' >> ~/.zshrc.local

```

---

## Maintenance

To update your tools and packages, run the following commands.

```bash
brew bundle --file=~/dotfiles/Brewfile
mise upgrade

```
