My vim settings backup

Install cscope and ctags
mv vimrc ~/.vimrc
mv plugin ~/.vim/

Display Git branch on PS1 in ~/.bashrc:
source /usr/share/git-core/contrib/completion/git-prompt.sh
#PS1='[\u@\h \W$(__git_ps1 " \e[1;35m(%s)\e[m")]\$ '
PS1='[\u \W$(__git_ps1 " (%s)")]\$ '
