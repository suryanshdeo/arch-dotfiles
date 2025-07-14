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
