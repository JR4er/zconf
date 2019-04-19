# set ZDOTDIR
export ZDOTDIR=${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}

# ensure that a non-login, non-interactive shell has a defined environment
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR}/.zprofile" ]]; then
	source "${ZDOTDIR}/.zprofile"
fi
