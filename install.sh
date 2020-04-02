#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	# zsh
    	sudo apt-get update 
	sudo apt-get install -y zsh 
	sudo chsh -s /bin/zsh $(whoami) 
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

	# autosuggestion
	export ub_version=$(lsb_release -r | awk '{print $2}')
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

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

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

exec "$SHELL"
