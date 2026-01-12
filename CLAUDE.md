# Claude Code Project Rules

## 1. Environment

* OS: macOS / zsh
* Source: ~/Dropbox/
* Link Target: ~/.config/ and ~/

## 2. Symbolic Link Rules (Priority)

* ALL config files must be physically stored in ~/Dropbox/.
* Use ln -sfn to link them to their destination.
* Mapping:
* ~/Dropbox/nvim -> ~/.config/nvim
* ~/Dropbox/ghostty -> ~/.config/ghostty
* ~/Dropbox/mise -> ~/.config/mise
* ~/Dropbox/starship/starship.toml -> ~/.config/starship.toml
* ~/Dropbox/karabiner -> ~/.config/karabiner
* ~/dotfiles/.zshrc -> ~/.zshrc

## 3. Privacy & Security

* Strict: DO NOT hardcode personal names or API keys in the repo.
* Action: Move PII/Keys to ~/.zshrc.local (Git ignored) and use environment variables.

## 4. Maintenance Commands

* Update Packages: brew bundle --file=~/dotfiles/Brewfile --cleanup
* Cleanup: Remove any legacy config files in ~ that are not symlinked to Dropbox.


