echo "TEST 3"

echo -e "\n Updating system \n"

sudo pacman -Syu

clear

sleep 3

echo -e "\n Installing pacman packages \n"

sudo pacman -S git firefox neovim zsh starship rofi-wayland waybar pamixer pavucontrol brightnessctl hyprpaper fzf unzip ntfs-3g gparted man tldr neofetch

sleep 3

clear

echo -e "\n Installing yay \n"

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

clear

sleep 3

echo -e "\n Installing yay packages \n"

echo -e "\n Installing logout screen \n"
yay wlogout

clear

sleep 1

echo -e "Installing GTK Theme"

yay arc-dark

sleep 1

echo -e "\n Installing Fonts \n"
yay firacode nerd
yay jetbrains nerd
yay otf font awesome
yay noto
yay noto cjk

clear

sleep 3

echo -e "\n Changing shell to zsh \n"
chsh -s $(which zsh)

echo "Installing syntax highlighting and completions"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

sleep 3

clear

echo "Installing dotfiles"
cp -rsf ~/arch-dotfiles/dotfiles/. ~
