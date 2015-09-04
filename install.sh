#!/bin/bash

cp vimrc ~/.vimrc
mkdir ~/.vim
cp -r plugin ~/.vim/

echo "
source /usr/share/git-core/contrib/completion/git-prompt.sh
#PS1='[\\u@\\h \\W\$(__git_ps1 \" \\e[1;35m(%s)\\e[m\")]\\\$ '
PS1='[\\u \\W\$(__git_ps1 \" (%s)\")]\\\$ '
" >> ~/.bashrc
source ~/.bashrc