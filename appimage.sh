#!/bin/bash

echo "This script will try to install install the nvim.appimage as /bin/nvim. It needs root privileges."
echo ""
echo "It also will add neovim as priority 70 to 'editor'. Or did you even think about using nano?"
echo ""

# Check if script is executed as root
if [ $(id -u) -eq 0 ]
then
	echo "Script executed as root. curl nvim.appimage to /bin/nvim.appimage"
	curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o /bin/nvim.appimage
	chmod +x /bin/nvim.appimage
	if command -v nvim 2>&1 >/dev/null
	then
		echo "Linking /bin/nvim.appimage to /bin/nvim"
		ln /bin/nvim.appimage /bin/nvim
	else
		echo "CAUTION: nvim command already existed. The appimage might be only available under nvim.appimage"
	fi

	# Add neovim to 'editor' alternatives
	update-alternatives --install /usr/bin/editor editor /usr/bin/nvim.appimage 70
	update-alternatives --auto editor


# Script is not executed as root. Try with sudo.
else
	# Check if sudo is available
	if command -v sudo 2>&1 >/dev/null
	then
		echo "Script executed as non root user. Trying with sudo. curl nvim.appimage to /bin/nvim.appimage"
		sudo curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o /bin/nvim.appimage
		sudo chmod +x /bin/nvim.appimage
		if ! command -v nvim 2>&1 >/dev/null
		then
			echo "Linking /bin/nvim.appimage to /bin/nvim"
			sudo ln /bin/nvim.appimage /bin/nvim
		else
			echo "CAUTION: nvim command already existed. The appimage might be only available under nvim.appimage"
		fi

		# Add neovim to 'editor' alternatives
		sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim.appimage 70
		sudo update-alternatives --auto editor

	else
		echo "ERROR: no root priviledges available"
	fi
fi
