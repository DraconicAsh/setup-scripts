#!/bin/sh
bold=$(tput bold)
norm=$(tput sgr0)

# Desktop setup
zypper in --no-recommends git zsh niri mako pipewire polkit-gnome xdg-desktop-portal-gtk

# Greeter setup
read -pr "Select a greeter (default T): ${bold}T${norm}uigreet | ${bold}S${norm}DDM:"  ans
case $ans in
    S|s)
        echo "${bold}Installing SDDM...${norm}"
    ;;
    
    * )
        echo "${bold}Installing tuigreet...${norm}"
    ;;
esac

# Neovim setup
read -pr "Setup Neovim? (Will install clang and npm) [Yn]? " ans
case $ans in
    N|n)
        echo "${bold}Skipping Neovim setup...${norm}"
    ;;

    * )
        echo "${bold}Setting up Neovim...${norm}"
        zypper in --no-recommends -y neovim clang clang-tools npm-default
        git clone https://github.com/DraconicAsh/kickstart.nvim.git ~/.config/nvim
        nvim --headless "+Lazy! sync" +qa
    ;;
esac

