# Suryansh's Arch Linux Dotfiles

Welcome to my personal collection of dotfiles for Arch Linux. This repository contains all the configuration files for my setup, which is centered around **Zsh**, **Ghostty**, and **Oh My Posh**. The configuration is managed using **GNU Stow**.


## Prerequisites

Before you begin, ensure you have the following:

* **Arch Linux**: A running instance of Arch Linux.
* **AUR Helper**: An AUR helper like `yay` is required for some packages. If you don't have one, you can install it first:
    ```bash
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    ```
* **GNOME Desktop Environment**: The instructions for setting the default terminal are specific to GNOME and Nautilus.

---

## Installation Guide

Follow these steps to replicate my setup on your system. The installation is broken down into logical parts.

### Step 1: Install Core Dependencies

First, we need to install `git` to clone this repository and `stow` to manage the dotfiles.

```bash
sudo pacman -S git stow
```

### Step 2: Install Shell, Terminal, and Prompt

This setup uses `zsh` as the shell, `ghostty` as the terminal emulator, and `oh-my-posh` for a customized prompt.

1.  **Install `zsh` and `ghostty` from the official repositories:**
    ```bash
    sudo pacman -S zsh ghostty
    ```

2.  **Install `oh-my-posh`:**
    ```bash
    # Create a local bin directory if it doesn't exist
    mkdir -p ~/.local/bin

    # Download the latest Oh My Posh binary
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O ~/.local/bin/oh-my-posh

    # Make it executable
    chmod +x ~/.local/bin/oh-my-posh
    ```
    > **Note:** The `.zshrc` file included in these dotfiles is already configured to use `oh-my-posh`.

### Step 3: Clone the Dotfiles

Clone this repository into your home directory.

```bash
git clone git@github.com:suryanshdeo/arch-dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```
> **Note:** It's good practice to clone dotfiles into a dedicated directory like `~/.dotfiles` to keep your home directory clean.

### Step 4: Deploy Dotfiles with Stow

GNU Stow will create symlinks from the files in this repository to their correct locations in your home directory.

From within the `~/.dotfiles` directory, run:

```bash
stow .
```
This command will symlink the contents of subdirectories (e.g., `zsh`, `ghostty`) to the corresponding locations in your home directory (`~`).

### Step 5: Configure System Defaults

The final step is to set our newly installed applications as the system defaults.

1.  **Set Zsh as your default shell:**
    You will be prompted for your password.
    ```bash
    chsh -s $(which zsh)
    ```

2.  **Set Ghostty as the default terminal emulator for GNOME:**
    ```bash
    gsettings set org.gnome.desktop.default-applications.terminal exec 'ghostty'
    gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''
    ```

3.  **Integrate Ghostty with Nautilus (File Manager):**
    This allows you to right-click and "Open in Terminal".
    ```bash
    # Install the 'Open Any Terminal' extension for Nautilus
    yay -S nautilus-open-any-terminal

    # Configure the extension to use Ghostty
    gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal ghostty
    gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
    gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true
    gsettings set com.github.stunkymonkey.nautilus-open-any-terminal flatpak system
    ```
4.  **Finalize Nautilus Integration:**
    This step removes potentially conflicting default configurations and reloads Nautilus.
    ```bash
    # Compile GSettings schemas
    sudo glib-compile-schemas /usr/share/glib-2-0/schemas/

    # This command removes a potentially conflicting default script. 
    # Check if `ghostty.py` exists before running.
    cd /usr/share/nautilus-python/extensions/ && ls 
    sudo rm -f /usr/share/nautilus-python/extensions/ghostty.py

    # Restart Nautilus to apply all changes
    nautilus -q
    ```

---

## Post-Installation

**All done!** For all changes to take full effect, especially the default shell, it's highly recommended to **log out and log back in** or restart your system.

Open Ghostty, and you should be greeted by a Zsh session with your new Oh My Posh prompt.

## How Stow Works

This repository is structured so that each folder corresponds to a piece of software. For example, all `zsh` related configurations are in the `zsh/` directory.

When you run `stow .`, it creates symlinks for all files and folders inside each package directory (like `zsh`, `ghostty`, etc.) directly into your `$HOME` directory. For instance, `zsh/.zshrc` will be symlinked to `~/.zshrc`.

