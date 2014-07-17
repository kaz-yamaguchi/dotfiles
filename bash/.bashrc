# completion
git_completion_sh=/usr/share/doc/git-1.7.1/contrib/completion/git-completion.bash
tmux_completion=/usr/share/doc/tmux-1.6/examples/bash_completion_tmux.sh
if [ -f ${git_completion_sh} ]; then
    source ${git_completion_sh}
fi
if [ -f ${tmux_completion} ]; then
    source ${tmux_completion}
fi

# Prompt
host_color='\[\e[01;36m\]' # 
git_branch_color='\[\e[1;35m\]' # 
normal_color='\[\e[00m\]' # white
# change color when using screen or tmux
if [ $TERM = 'screen-bce' -o $TERM = 'screen' ]; then
    term_color='\[\e[1;35m\]' # light purple
else
    term_color='\[\e[00m\]' # white
fi
# change color when using vim shell command
if [ "x$VIMRUNTIME" != "x" ]; then
    term_color='\[\e[1;33m\]'
fi


SMILY="( '')  "
FROWNY="( > <)  "
FACE_MARK="if [ \$? == 0 ]; then echo \"${SMILY}\"; else echo \"${FROWNY}\"; fi"

export PS1="\n\`${FACE_MARK}\`\w ${git_branch_color}\$(__git_ps1)\n${term_color}\u${normal_color}@${host_color}\h${normal_color} \$ "

# alias
if [ -f ~/.bashrc.alias ]; then
    source ~/.bashrc.alias
fi
