# arch-dotfiles

This directory contains the dotfiles for my system

## Requirements

### Git & Stow

```
sudo pacman -S git stow
```

### zsh, oh-my-posh and ghostty

Install zsh, ghostty and oh-my-posh

```
sudo pacman -S zsh ghostty
```
```
chsh -s $(which zsh)
```
```
mkdir -p ~/.local/bin
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 \
  -O ~/.local/bin/oh-my-posh
chmod +x ~/.local/bin/oh-my-posh
```

Make ghostty default

```
gsettings set org.gnome.desktop.default-applications.terminal exec 'ghostty'
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''
```
```
yay -S nautilus-open-any-terminal
```
```
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal ghostty
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal flatpak system
cd /usr/share/nautilus-python/extensions/
ls
sudo rm -rf ghostty.py
nautilus -q
```

## Stow

First, check out the dotfiles repo in your $HOME directory using git

```
git clone git@github.com:suryanshdeo/arch-dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks

```
stow .
```
