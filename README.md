# arch-dotfiles

This directory contains the dotfiles for my system

## Requirements

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

### zsh and oh-my-posh

```
pacman -S zsh
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


## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:suryanshdeo/arch-dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```
