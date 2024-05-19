sudo apt update

# C stuff
sudo apt install build-essential libpam0g-dev libxcb-xkb-dev
sudo apt-get install gcc make

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
# MAKE SURE TO ALSO INSTALL PRAGTICAL 

xdg-user-dirs-update

# Screenshots
sudo apt install maim
# TODO Add command to sxhkd
# maim -s | xclip -selection clipboard -t image/png


# Login screen with lightdm * NOTE Use better lockscreen instead?
sudo apt install lightdm
sudo cp contrib/freedesktop/bspwm.desktop /usr/share/xsessions/

sudo apt install gh

# FLATPAK APPS
# TODO ADD PLANIFY
# TODO ADD FOR PLANIFY flatpak run --command=io.github.alainm23.planify.quick-add io.github.alainm23.planify
# TODO ADD DISCORD
