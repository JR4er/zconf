if ! zstyle -t ':zconf:module:syntax-highlighting' color; then
	return
fi

source ${0:A:h}/syntax-highlighting/fast-syntax-highlighting.plugin.zsh

zstyle -s ':zconf:module:syntax-hightlighting' theme '_zconf_sh_theme'
if [[ -n $_zconf_sh_them ]]; then
	fast-theme $_zconf_sh_theme
fi
unset _zconf_sh_theme
