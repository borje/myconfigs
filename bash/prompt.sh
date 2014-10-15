# The prompt
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
BYellow="\[\033[1;33m\]"      # Yellow
COLOR_NONE="\[\e[0m\]"

export GIT_PS1_SHOWDIRTYSTATE=true

function prompt_func() {
    previous_return_value=$?;
    HOST=""

    echo $SSH_CONNECTION | grep 127.0.0.1 > /dev/null
    if [ $? -ne 0 ]; then
	HOST="\h:"
    fi
    prompt="\[\e[00;37m\][\A] \[\e[0m\]\[\e[00;31m\]\u\[\e[0m\]\[\e[00;37m\]@\h [\[\e[0m\]\[\e[00;32m\]\w\[\e[0m\]\[\e[00;37m\]]${BYellow}$(__git_ps1 " (%s) ")${COLOR_NONE}"


    # Color the prompt if the last command return exit status != 0
    if test $previous_return_value -eq 0
    then
        PS1="${prompt}\$ "
    else
        PS1="${prompt}${RED}${previous_return_value}\$${COLOR_NONE} "
    fi
}

export GIT_PS1_SHOWDIRTYSTATE=1

PROMPT_COMMAND=prompt_func
