fpath=(${0:A:h}/prompt $fpath)

autoload -Uz promptinit && promptinit

zstyle -a ':zconf:module:prompt' theme 'prompt_theme_name'
if [[ "$TERM" == (dumb|linux|*bsd*) ]] || (( $#prompt_theme_name < 1)); then
	prompt 'off'
else
	prompt "$prompt_theme_name[@]"
fi
unset prompt_theme_name
