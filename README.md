# dotfiles

This is my first version of my dotfiles based on Arch, AwesomeWm and NeoVim.

## Showcase
|neofetch|i3lock-fancy|
|-|-|
|![](https://github.com/Powerleech/dotfiles/blob/master/Pictures/awesome-theme.png)|![](https://github.com/Powerleech/dotfiles/blob/master/Pictures/i3lock-fancy.png?raw=true)|
|nvim|sddm|
|![](https://github.com/Powerleech/dotfiles/blob/master/Pictures/vim.png?raw=true)|![](https://github.com/Powerleech/dotfiles/blob/master/Pictures/sddm.png?raw=true)|



> First of all you should install the [git version of AwesomeWM](https://github.com/awesomeWM/awesome/).

```sh
yay awesome-git
```

> Install Nvim
```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage /usr/bin/nvim
nvim +PackerSync
```

> Install necessary dependencies

```sh
yay -Sy picom-git rofi i3-lock rofi-greenclip sddm-sugar-dark sddm rofi-pass acpi \
acpid acpi_call upower lxappearance-gtk3 ripgrep nerd-fonts-complete-starship \
jq inotify-tools polkit-gnome xdotool xclip gpick ffmpeg blueman redshift \
pipewire pipewire-alsa pipewire-pulse alsa-utils brightnessctl feh maim \
mpv mpc python-mutagen playerctl --needed
```


# Probs
Bare repo for dot files - Thanks to [this](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/) article:
