# Modify this string to set path for "packages.txt"
PKGLIST="./packages.txt"

# Install reflector
echo -e "\nInstalling reflector ...\n"
pacman -S reflector --noconfirm --needed --color always 1> /dev/null

# Refreshing mirrors
echo -e "\nRefreshing mirrors ...\n"
reflector --latest 200 --sort rate --save /etc/pacman.d/mirrorlist

# Installs packages specified in PKGLIST
echo -e "\nInstalling packages:\n"
while IFS="" read -r PKG
do
	sudo pacman -S $PKG --noconfirm --needed --noprogressbar --color always 1>> log.txt
	echo -e "Installing $PKG ... done"
done < $PKGLIST

# Add user and set shell
echo -e "\nCreating and adding user \"wrikd\" to the wheel group and setting default shell to zsh ...\n"
useradd -m -g wheel -s /usr/bin/zsh wrikd

# Setting up sudo without password for wheel
# 5 second timeout for reading instruction
echo -e "\nUncomment wheel group in line 85 for sudo without password ...\n"
sleep 5
EDITOR=/usr/bin/vim visudo

echo -e "\nSet password for wrikd ...\n"
passwd wrikd

echo -e "\nAll done!\nArch successfully setup :)\n"
