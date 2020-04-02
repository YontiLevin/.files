#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	# zsh
    	sudo apt-get update 
	sudo apt-get install -y zsh 
	sudo chsh -s /bin/zsh ubuntu 
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

	# solarized
	sudo apt-get install dconf-cli
	git clone https://github.com/aruhier/gnome-terminal-colors-solarized.git
	cd gnome-terminal-colors-solarized
	./install.sh

elif [[ "$OSTYPE" == "darwin"* ]]; then
        # zsh
	brew install zsh
	chsh -s $(which zsh)
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	
	# solarized
	cd ~/Documents;\
	git clone https://github.com/altercation/solarized
	echo "go to Terminal > Preferences and import the color scheme"

else
	echo "unknown OSTYPE: $OSTYPE" 
fi

cd ~



