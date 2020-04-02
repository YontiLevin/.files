#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	# zsh
    	sudo apt-get update 
	sudo apt-get install -y zsh 
	sudo chsh -s /bin/zsh $(whoami) 
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

	# autosuggestion
	export ub_version=$(lsb_release -r | awk '{print $2}')
	sudo sh -c "echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-autosuggestions/xUbuntu_$ub_version/ /' > /etc/apt/sources.list.d/shells:zsh-users:zsh-autosuggestions.list"
	wget -nv https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/xUbuntu_$ub_version/Release.key -O Release.key
	sudo apt-key add - < Release.key
	sudo apt-get update
	sudo apt-get install zsh-autosuggestions

	sudo sh -c "echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-syntax-highlighting/xUbuntu_$ub_version/ /' > /etc/apt/sources.list.d/shells:zsh-users:zsh-syntax-highlighting.list"
	wget -nv https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/xUbuntu_ub_version/Release.key -O Release.key
	sudo apt-key add - < Release.key
	sudo apt-get update
	sudo apt-get install zsh-syntax-highlighting

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
