# arch-dotfiles

This directory contains the dotfiles for my system

## Requirements

### Git

```
sudo pacman -S git
```

### Stow

```
sudo pacman -S stow
```

### zsh, oh-my-posh and ghostty

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
```
gsettings set org.gnome.desktop.default-applications.terminal exec 'ghostty'
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
git clone git@github.com:suryanshdeo/arch-dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks

```
stow .
```
