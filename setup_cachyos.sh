#!/usr/bin/env zsh
# ===========================================
# Arch / CachyOS: Personal Setup Script
# ===========================================

echo "[System] Update"
sudo pacman -Syyu

# -------------------------------------------
# VS code
# -------------------------------------------
yay -S visual-studio-code-bin

# -------------------------------------------
# Espanso (snippets tool)
# -------------------------------------------
git clone https://github.com/espanso/espanso # Clone the Espanso repository
cd espanso
cargo build -p espanso --release --no-default-features --features modulo,vendored-tls,wayland # Compile espanso in release mode
sudo mv target/release/espanso /usr/local/bin/espanso # https://espanso.org/docs/install/linux/#installing-espanso-1
sudo setcap "cap_dac_override+p" $(which espanso)
espanso service register # Register espanso as a systemd service (required only once)
espanso start

# -------------------------------------------
# Git Delta / Bat / Lazygit
# -------------------------------------------
sudo pacman -S git-delta bat
bat cache --build
sudo pacman -S lazygit

# -------------------------------------------
# Rust → setup_rust.sh
# -------------------------------------------

# -------------------------------------------
# Launcher: Walker + Elephant 
# -------------------------------------------
git clone https://github.com/abenz1267/walker.git
cd walker && cargo build --release && cd -
yay -S gtk4-layer-shell \
       elephant \
       elephant-desktopapplications \
       elephant-clipboard \
       elephant-snippets \
       elephant-providerlist

mkdir -p ~/.config/elephant
elephant service enable && systemctl --user restart elephant
# memo: install済み: wofi fuzzel

# -------------------------------------------
# Flare (AppImage)
# -------------------------------------------
wget https://github.com/ByteAtATime/flare/releases/download/v0.1.0/flare_0.1.0_amd64.AppImage \
  -O ~/.local/bin/flare.AppImage
chmod +x ~/.local/bin/flare.AppImage

# -------------------------------------------
# hdrop
# -------------------------------------------
git clone https://github.com/Schweber/hdrop.git
cd hdrop && make install && cd -

# -------------------------------------------
# anki
# -------------------------------------------
# https://apps.ankiweb.net/
# tar xaf Downloads/anki-2XXX-linux-qt6.tar.zst
# cd anki-2XXX-linux-qt6
# sudo ./install.sh

# -------------------------------------------
# Flatpak
# -------------------------------------------
sudo pacman -S flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# -------------------------------------------
# Slack, LocalSend, beekeeper ...
# -------------------------------------------
yay -S slack-desktop-wayland
yay -S beekeeper-studio
yay -S localsend-bin
# sudo iptables -L
# sudo iptables -A INPUT -p udp --dport 53317 -j ACCEPT
# sudo iptables -A INPUT -p tcp --dport 53317 -j ACCEPT
# copy aws, ssh, env files
# clone hurl repo, localsend 01.works

# ----------------------------------------------------------
# Antivirus
# ----------------------------------------------------------
sudo pacman -S clamav clamtk 

# -------------------------------------------
# Screenshot tool
# -------------------------------------------
# https://flameshot.org/docs/guide/wayland-help/#can-t-screen-anything-on-wayland-hyprland
sudo pacman -S flameshot
flameshot config # use grim

# -------------------------------------------
# Cursor (AppImage recommended)
# -------------------------------------------
# download AppImage from Cursor HP
mv ~/Downloads/cursor.AppImage ~/.local/bin/cursor.AppImage
chmod +x ~/.local/bin/cursor.AppImage
vi ~/.local/share/applications/cursor-appimage.desktop
cat <<EOF > ~/.local/share/applications/cursor-appimage.desktop
[Desktop Entry]
Name=Cursor (AppImage)
Exec=env GTK_IM_MODULE=fcitx QT_IM_MODULE=fcitx XMODIFIERS=@im=fcitx ~/.local/bin/cursor.AppImage
Type=Application
Categories=Development;IDE;
EOF
update-desktop-database ~/.local/share/applications
# [Desktop Entry]
# Name=Cursor (AppImage)
# Comment=AI-powered code editor
# Exec=env GTK_IM_MODULE=fcitx QT_IM_MODULE=fcitx XMODIFIERS=@im=fcitx ~/.local/bin/cursor.AppImage
# Icon=cursor
# Terminal=false
# Type=Application
# Categories=Development;IDE;
# StartupNotify=true

# -------------------------------------------
# yazi
# -------------------------------------------
sudo pacman -S yazi ffmpeg 7zip jq fd zoxide resvg
sudo pacman -S poppler ripgrep fzf imagemagick

# -------------------------------------------
# Node via mise
# -------------------------------------------
curl https://mise.run | sh
echo '~/.local/bin/mise activate fish | source' >> ~/.config/fish/config.fish
# mise use --global node@22
# mise exec node@22 -- node -v
# mise exec --node -v
# mise list
## project example
# mise use node@20.18.1

# -------------------------------------------
# tmux
# -------------------------------------------
sudo pacman -S tmux

# -------------------------------------------
# Editors & Media Tools (mpv, obs-studio, kdenlive)
# -------------------------------------------
sudo pacman -S mpv obs-studio kdenlive qt6-wayland
# mpv: error while loading shared libraries: libglslang.so.16: cannot open shared object file: No such file or directory 
# obs: error while loading shared libraries: libglslang.so.16: cannot open shared object file: No such file or directory
# kdenlive: error while loading shared libraries: libglslang.so.16: cannot open shared object file: No such file or directory
sudo pacman -S glslang --overwrite='*'
# mpv: error while loading shared libraries: libglslang.so.15: cannot open shared object file: No such file or directory
# kdenlive: /usr/lib/libQt6Core.so.6: version Qt_6.10' not found (required by /usr/lib/libQt6NetworkAuth.so.6)
sudo pacman -Syu mpv

# -------------------------------------------
# Docker
# -------------------------------------------
sudo pacman -S docker docker-compose docker-buildx
sudo usermod -aG docker $USER
sudo pacman -S lazydocker

# -------------------------------------------
# Desktop Apps
# -------------------------------------------
sudo pacman -S libreoffice-fresh  # office
sudo pacman -S spotify-launcher # spotify
yay -S google-chrome # chrome
yay -S obsidian # obisidian
sudo pacman -S tailscale # tailscale

# -------------------------------------------
# Fonts / IME
# -------------------------------------------
sudo pacman -S noto-fonts-cjk noto-fonts-emoji
sudo pacman -S fcitx5-im fcitx5-mozc

# -------------------------------------------
# Neovim
# -------------------------------------------
sudo pacman -S neovim
sudo pacman -Sy cachyos-keyring

# -------------------------------------------
# vivaldi
# -------------------------------------------
sudo pacman -S cachyos-extra-znver4/vivaldi

# -------------------------------------------
# 1password https://support.1password.com/install-linux/#arch-linux
# -------------------------------------------
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
yay -S 1password

# -------------------------------------------
# Hyprland Dotfiles (end-4)
# -------------------------------------------
git clone https://github.com/end-4/dots-hyprland
cd dots-hyprland & ./setup.sh;

# ----------------------------------------------------------
# Bluetooth
# ----------------------------------------------------------
sudo pacman -S bluez bluez-utils blueman bluetuith
sudo systemctl enable --now bluetooth

# ----------------------------------------------------------
# Networking Utilities
# ----------------------------------------------------------
sudo pacman -Syu linux-firmware
sudo systemctl enable --now NetworkManager
#（以下は必要なときに手で実行）
# nmcli device status
# nmcli connection show
# rfkill list
# lsmod | grep wifi/mt79/rtl
# dmesg | grep -i wifi
# ip a

# ----------------------------------------------------------
# wallpaper
# ----------------------------------------------------------
https://github.com/mylinuxforwork/wallpaper
