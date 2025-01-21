This setup is optimized for efficiency, customization, and a smooth development environment using **Alacritty**, **i3**, **Neovim**, **Polybar**, **Rofi**, **Picom**, **Starship**, and other tools.

## Table of Contents

1. [Overview](#overview)
2. [Tools and Configurations](#tools-and-configurations)
    - [Alacritty](#alacritty)
    - [i3](#i3)
    - [Neovim](#neovim)
    - [Polybar](#polybar)
    - [Rofi](#rofi)
    - [Picom](#picom)
    - [Starship](#starship)
3. [Installation and Setup](#installation-and-setup)

## Overview

This setup is a combination of powerful tools and streamlined configurations to help you stay productive while maintaining an efficient and aesthetically pleasing development environment. The configurations are handled through **NixOS**, a declarative operating system that allows you to define system configurations in a reproducible and version-controlled way. The system setup is tailored to provide a smooth and fast user experience using a tiling window manager, modern terminal, and a variety of essential utilities for development and customization.

## Tools and Configurations

### Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is a fast, GPU-accelerated terminal emulator. It is highly configurable and lightweight, providing a great experience when paired with a tiling window manager like **i3**. Here’s how I’ve customized it:

- **Configuration File**: `~/.config/alacritty/alacritty.yml`
    - Color schemes: Custom themes for better visibility and contrast.
    - Font setup: Using a programming-friendly font such as **FiraCode** or **Hack**.
    - Transparency settings to suit my aesthetic preferences (handled by Picom).

### i3

[i3](https://i3wm.org/) is a dynamic tiling window manager that maximizes screen real estate and enhances productivity with keyboard-driven workflows. My configuration includes:

- **Workspace and window layout configurations**: Easy access to workspaces with custom keybindings.
- **Focus behavior**: Automatic window focus management, allowing smooth navigation.
- **Autostart applications**: Automatically launching essential programs such as **Polybar**, **Rofi**, and **Picom** on startup.

**Configuration File**: `~/.config/i3/config`

### Neovim

[Neovim](https://neovim.io/) is a highly extensible text editor, perfect for development and writing. I’ve set up Neovim with the following key features:

- **Plugins**: Managed using **vim-plug**, including essential plugins for syntax highlighting, autocompletion, LSP (Language Server Protocol), and Git integration.
- **Customization**: Keybindings and macros optimized for coding efficiency.
- **Themes and UI**: Integrated with **Nord** or **gruvbox** for consistent aesthetics.
- **LSP Support**: Integrated with LSP servers for various languages, enhancing my development experience.

**Configuration File**: `~/.config/nvim/init.vim`

### Polybar

[Polybar](https://github.com/polybar/polybar) is a highly customizable status bar for X11, which can be used to display system stats, workspaces, and other important information. My configuration includes:

- **Custom Modules**: Displaying system stats such as CPU, memory, and battery.
- **Workspaces**: Integration with i3 to show active workspaces and applications.
- **Styling**: Configured for a clean, minimal look with icons and color schemes.

**Configuration File**: `~/.config/polybar/config`

### Rofi

[Rofi](https://github.com/davatorium/rofi) is a fast, window switcher, application launcher, and dmenu replacement. I use it for:

- **Application Launching**: Easily launching apps and searching through them.
- **Window Switching**: Quickly cycling through open windows in a neat and organized manner.
- **File Search**: Searching for files in the home directory or other locations.

**Configuration File**: `~/.config/rofi/config.rasi`

### Picom

[Picom](https://github.com/yshui/picom) is a compositor for X11 that provides effects like transparency, shadows, and fading. It’s used to enhance the visual experience in my setup, especially for:

- **Transparency**: Terminal and window transparency effects.
- **Fading**: Smooth window opening/closing animations.
- **Shadows**: Subtle drop shadows around windows for a 3D effect.

**Configuration File**: `~/.config/picom/picom.conf`

### Starship

[Starship](https://starship.rs/) is a cross-shell prompt that provides a minimal and customizable experience. I use it for:

- **Unified Prompt**: Works across various shells, including **bash**, **zsh**, and **fish**.
- **Customization**: Displaying useful information like Git status, Node version, and Python environment directly in the prompt.
- **Aesthetics**: Clean and beautiful prompts with minimal distraction.

**Configuration File**: `~/.config/starship.toml`

## Installation and Setup
`sh -c "$(curl -fsLS get.chezmoi.io/lb)" --init --apply $kendellb`
https://www.chezmoi.io/user-guide/daily-operations/
