alias ..='cd ..'
alias ls=lsd
alias ll='ls -lFh'
alias lm='ls | more'
alias la='ls -alFh --group-directories-first'
alias lsn='ls | cat -n'
alias mkdir='mkdir -pv'
# alias cp='cp --preserve=all -v'
# alias cpr='cp --preserve=all -Rv'
alias count='find . -type f -not -path "*/\.*" | wc -l'
alias count-all='find . -type f | wc -l'
alias fbig="find . -size +128M -type f -printf '%s %p\n'| sort -nr | head -16"
alias n='exec bash'
alias c='clear'
alias q='exit'

