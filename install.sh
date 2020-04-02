#!/bin/bash
sudo apt-get update && sudo apt-get install -y zsh && \
sudo chsh -s /bin/zsh ubuntu && \
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"



