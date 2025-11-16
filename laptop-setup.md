# laptop setup (mac)4

instructions to setup a new macbook

## adblocker

- [ ] setup adguard private dns

## setup homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## general settings
- [ ] turn keyboard brightness all the way down
- [ ] increase key repeat rate
- [ ] enable natural scrolling
- [ ] auto hide the dock
- [ ] clean up the dock
```
finder, browser, terminal, ide, slack, zoom, spotify | downloads, trash
```
- [ ] disable suggested and recent apps in dock
- [ ] enable natural scrolling just for logitech mouse (logi options setup)
- [ ] install monitorcontrol (brightness + sound)

## keymaps

- [ ] press globe key to do nothing
- [ ] map caps to globe key (will be used for caps + hjkl movement)
- [ ] switch to left/right workspace using option+shift+h/l
- [ ] switch to desktop 1..9 using option+n

## show in control center

- [ ] music recognization (small)
- [ ] keyboard brightness (large)
- [ ] shrink display, sound

## spotlight

- [ ] disable all categories except apps, calculator

## safari / chrome

- [ ] dark reader

## keyboard

- [ ] enable press and hold to repeat
```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```
- [ ] keys not repeating in intellij
```bash
defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool false
```
- [ ] custom key bindings (refer skhdrc)

## packages

```bash
brew install amethyst aria2 bat bitwarden discord fzf koekeishiya/formulae/skhd logi-options+ monitorcontrol neofetch neovim powerlevel10k ripgrep spotify tree vlc wezterm@nightly yazi zsh-completions zsh-syntax-highlighting
```

- [ ] grant full disk access to wezterm
- [ ] skhd --start-service

## mouse

- [ ] setup logi-options+ to use natural scrolling for mouse

## git setup

```bash
git config --global user.name "Wrik Das"
git config --global user.email wrikdas22@gmail.com
```

## dotfiles

- [ ] clone [dotfiles](https://github.com/dwrik/dotfiles)

## file manager

- [ ] follow instructions in yazi `init.lua` file

## text editor

- [ ] run `:PlugInstall` from inside nvim

