sudo apt update

# Library Generation stuff
sudo apt install build-essential libpam0g-dev libxcb-xkb-dev

# AMD Firmware % https://wiki.debian.org/InstallingDebianOn/Thinkpad/E14%20Gen3/bookworm
sudo apt-get install firmware-amd-graphics
echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf
sudo apt-get install firmware-misc-nonfree firmware-realtek

# Install x-11
sudo apt install xorg xorg-init

# Install bspwm
sudo apt install bspwm bspc sxhkd
# -- TODO set sxhkd config files

# Install polybar
sudo apt install polybar

# Install python stuff
sudo apt install python3
sudo apt install python3-pip
sudo apt install python3-venv

# Firefox
sudo apt install firefox-esr

# Install wallpaper
sudo apt install feh

# Install file manager
sudo apt install thunar

# Install fonts
# terminus-font ttf-font-awesome adobe-source-code-pro-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra tamzen-font xkcd-font

# Install rofi and basic launching tools
sudo apt install rofi dmenu

# Install a terminal and tools
sudo apt install rxvt-unicode
# Base fish
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null
sudo apt install fish
# Oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
fish install --path=~/.local/share/omf --config=~/.config/omf
curl -sL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install.sha256 | shasum -a 256 --check
# Fish gruvbox theme
omf install https://github.com/sujaybokil/fish-gruvbox
# -- TODO Add content kitty to launch with fish automatically

# Install a compositor 
sudo apt install picom

# Wifi
sudo apt install network-manager

# Bluetooth
sudo apt install bluez*
sudo apt install blueman
sudo systemctl enable bluetooth.service

# Image viewer/converter
sudo apt install imagemagick

# Install pywal to cofigure themes
sudo pip3 install pywal --break-system-packages

# cp dotfiles now
cp -rf ~/dotfiles ~

# Wallpaper
curl https://i.imgur.com/XCaXGFB.png > ~/wallpaper.png

echo "$ feh --bg-fill ~/wallpaper.png"
echo "$ wal -i ~/wallpaper.png"

# Command line utils
sudo apt install unzip

# Text Editor
sudo apt install geany geany-plugins

xdg-user-dirs-update

# Screenshots
sudo apt install maim
# TODO Add command to sxhkd
# maim -s | xclip -selection clipboard -t image/png

# Login screen with lightdm * NOTE Use better lockscreen instead?
sudo apt install lightdm
sudo cp contrib/freedesktop/bspwm.desktop /usr/share/xsessions/

# Github 
sudo apt install gh

# texstudio and tex
sudo apt install texlive 
# Uncomment to add rest of latex, however takes long time to work
# sudo apt install texlive-full
sudo apt install texstudio
# TODO Create texstudio theme

# FLATPAK APPS
sudo apt install flatpak
flatpak install flathub io.github.alainm23.planify
# TODO add planify flatpak run --command=io.github.alainm23.planify.quick-add io.github.alainm23.planify to skhd
flatpak install flathub com.discordapp.Discord

# APPIMAGES
# Appimage Launcher
sudo dpkg -i AppImageLauncher.deb
sudo ail-cli integrate Pragtical.AppImage
# TODO add pragtical configuration files
# TODO Add pluggable backends for java, ocaml, gcc, python, etc for debugger in ocaml

# Programming Languages
# Java
sudo apt install default-jdk
# TODO Automatically set environment variable JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
# C
sudo apt-get install gcc make
# OCaml
sudo apt install opam
opam init --bare -a -y
opam switch create main-switch ocaml-base-compiler.5.1.1
eval $(opam env)
opam switch list
opam install -y utop odoc ounit2 qcheck bisect_ppx menhir ocaml-lsp-server ocamlformat
# Add the following lines to user module in pragtical to add lsp support
# local lspconfig = require "plugins.lsp.config"
# lspconfig.ocaml_lsp.setup{}

