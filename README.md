This setup is optimized for efficiency, customization, and a smooth development environment using **Alacritty**, **i3**, **Neovim**, **Polybar**, **Rofi**, **Picom**, **Starship**, and other tools.

## Table of Contents

1. [Overview](#overview)
2. [Installation and Setup](#installation-and-setup)
3. [Tools and Configurations](#tools-and-configurations)
    - [Alacritty](#alacritty)
    - [i3](#i3)
    - [Neovim](#neovim)
    - [Polybar](#polybar)
    - [Rofi](#rofi)
    - [Picom](#picom)
    - [Starship](#starship)
    - [Neofetch](#neofetch)


## Overview

This setup is a combination of powerful tools and streamlined configurations to help you stay productive while maintaining an efficient and aesthetically pleasing development environment. The configurations are handled through **NixOS**, a declarative operating system that allows you to define system configurations in a reproducible and version-controlled way. The system setup is tailored to provide a smooth and fast user experience using a tiling window manager, modern terminal, and a variety of essential utilities for development and customization.
### Wallpaper
![Wallpaper](Wallpapers/wp4199379-jean-giraud-moebius-wallpapers.png)

### Screenshot


## Installation and Setup
`sh -c "$(curl -fsLS get.chezmoi.io/lb)" --init --apply $kendellb`
https://www.chezmoi.io/user-guide/daily-operations/

## Tools and Configurations

### Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is a fast, GPU-accelerated terminal emulator. It is highly configurable and lightweight.

**Configuration File**: `~/.config/alacritty/`

### i3

[i3](https://i3wm.org/) is a dynamic tiling window manager that maximizes screen real estate and enhances productivity with keyboard-driven workflows. My configuration includes:

**Configuration File**: `~/.config/i3/config`

### Neovim

[Neovim](https://neovim.io/) is a highly extensible text editor, perfect for development and writing. I’ve set up Neovim with the following key features:

**Configuration File**: `~/.config/nvim/init.vim`

### Polybar

[Polybar](https://github.com/polybar/polybar) is a highly customizable status bar for X11, which can be used to display system stats, workspaces, and other important information. My configuration includes:

**Configuration File**: `~/.config/polybar/config`

### Rofi

[Rofi](https://github.com/davatorium/rofi) is a fast, window switcher, application launcher, and dmenu replacement. I use it for:


**Configuration File**: `~/.config/rofi/config.rasi`

### Picom

[Picom](https://github.com/yshui/picom) is a compositor for X11 that provides effects like transparency, shadows, and fading. It’s used to enhance the visual experience in my setup, especially for:


**Configuration File**: `~/.config/picom/picom.conf`

### Starship

[Starship](https://starship.rs/) is a cross-shell prompt that provides a minimal and customizable experience. I use it for:


**Configuration File**: `~/.config/starship.toml`

### Neofetch

[Neofetch](https://github.com/dylanaraps/neofetch) is a command-line system information tool written in bash. It displays information about your system in a visually appealing way, with an ASCII logo of your operating system and important system details.

**Configuration File**: `~/.config/neofetch/config.conf`

