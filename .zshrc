# source zconf
if [[ -s "${ZDOTDIR}/zconf.zsh" ]]; then
	source "${ZDOTDIR}/zconf.zsh"
fi

# color check
if [[ "$TERM" == 'dumb' ]]; then
	zstyle ':zconf:*:*' color 'no'
	zstyle ':zconf:module:prompt' theme 'off'
fi

# load zconf modules
zstyle -a ':zconf:mod' load 'zconf_modules'
for zconf_module in "$zconf_modules[@]"; do
	source "${ZDOTDIR}/modules/${zconf_module}.zsh"
done
unset zconf_module{s,}
