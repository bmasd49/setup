#!/bin/bash

echo "Hello $USER, you are about to install bmasd49's Linux setup."

read -p "Are you sure that you want to do this? [y/n] " -r
echo    # (optional) move to a new line

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi

echo "Okay then"

installEssentialPackages () {
	apt update
	apt upgrade
	apt install build-essential cmake vim python3-dev texlive-latex-extra
}

copyDotFiles () {
	cp -r ./dotfiles/. ~
	source ~/.bashrc
}

installChrome () {
	if ! dpkg-query -l google-chrome-stable >/dev/null 2>&1; then 
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/
		apt install /tmp/google-chrome-stable_current_amd64.deb
	else 
		echo "Chrome has been installed already"
	fi
}

installVimPlugins () {
	if test -f ~/.vim/autoload/plug.vim; then
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		vim +'PlugInstall --sync' +qa
		python3 ~/.vim/plugged/YouCompleteMe/install.py --clangd-completer
	else
		echo "VimPlug has been installed already"
	fi
}

installBamboo () {
	if ! dpkg-query -l ibus-bamboo >/dev/null 2>&1; then 
		sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
		sudo apt-get update
		sudo apt-get install ibus-bamboo
		ibus restart
	else 
		echo "ibus-bamboo has been installed already"
	fi
}

echo
read -p "Do you want to update all packages and install essential packages (build-essential cmake vim python3-dev texlive-latex-extra)? [y/n] " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	installEssentialPackages
fi

echo
read -p "Do you want to copy dotfiles (.vimrc, .bashrc, .bash_aliases, .inputrc) [y/n] " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	copyDotFiles
	echo "Done"
fi

echo
read -p "Do you want to install Chrome? [y/n] " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	installChrome
fi

echo
read -p "Do you want to install Vim-Plug and vim's plugins? [y/n] " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	installVimPlugins
fi

echo
read -p "Do you want to install ibus-bamboo (Vietnamese input method)? [y/n] " -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	installBamboo
fi

echo "All done"
