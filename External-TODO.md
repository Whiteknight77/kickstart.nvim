# The following stuff has do be done outside neovim

## Package-Managers

The following package managers (and language-dev-kits) are recommended:

- pip3
- cargo
- npm
- go
  - `curl` / `wget` https://go.dev/dl/go[current-version].linux-amd64.tar.gz
  - `tar -C /usr/local -xzf go[version].linux-amd64.tar.gz`
  - add `/usr/local/go/bin` to the `$PATH` (`~/.profile` / `~/.bashrc`)
- SKDMAN!
  - `curl -s "https://get.sdkman.io" | bash`


## Nerd-Fonts

1. Pull some nerdfonts - e.g. run the ./setup.sh script - it will curl DroidM into ~/.local/share/fonts
2. Setup Terminal emulator to use them (e.g. Konsole: configure the Mono-Fonts in KDE-Settings)


## LSP-Config

### Arduino / ESP

To develop for ESP32 install required tools as described in https://docs.espressif.com/projects/esp-idf/en/stable/esp32/get-started/linux-macos-setup.html

***Recommendation:** use `~/.local/esp/` instead of `~/esp/`*


## OneTerm

### Install external tools

- fzf
  - `apt install fzf`
- ripgrep
  - `apt install ripgrep`
  - alternatively if rust is installed and working: `cargo install ripgrep`
- lazygit
  - `go install github.com/jesseduffield/lazygit@latest`
  - no apt package
- gitui
  - `cargo install gitui` - 2024-11-22 compiler errors
