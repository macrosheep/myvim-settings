#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp vimrc ~/.vimrc

#PS1=$'\e[1;33m\u256d\e[m \w$(__git_ps1 " \e[1;35m(%s)\e[m")\n\e[1;33m\u2570\e[m Yang \$ '

echo "
source /usr/share/git-core/contrib/completion/git-prompt.sh
#PS1='[\\u@\\h \\W\$(__git_ps1 \" \\e[1;35m(%s)\\e[m\")]\\\$ '
PS1='[\\u@\\h \\W\$(__git_ps1 \" (%s)\")]\\\$ '

alias uptags='ctags -R; cscope -Rbkq'
" >> ~/.bashrc
source ~/.bashrc
