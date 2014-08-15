# if $HOME/bin is not on $PATH, put it first
if [[ $PATH != *$HOME/bin* ]]; then
	export PATH="$HOME/bin:$PATH"
fi

# if in a Mac OSX environment with Homebrew installed
if hash brew 2> /dev/null; then
	if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
		. $(brew --prefix)/etc/bash_completion
	fi
fi

export PROMPT_COMMAND=__prompt_command
__prompt_command () {
    local EXIT="$?"
    local RED=$(tput setaf 1)
    local GREEN=$(tput setaf 2)
    local ORANGE=$(tput setaf 3)
    local CYAN=$(tput setaf 6)
    local RESET=$(tput sgr0)

    local PROMPT="\[$RED\]:("
    if [ $EXIT == 0 ]; then
        PROMPT="\[$GREEN\]:)"
    fi

    PS1="\[$RESET\]\[$GREEN\]\u:\h: \[$CYAN\]\w\[$RESET\]\n$PROMPT \[$RESET\]"
}