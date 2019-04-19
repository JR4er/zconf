source ${0:A:h}/autosuggestions/zsh-autosuggestions.zsh

zstyle -s ':zconf:module:autosuggestions:color' found \
	'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE' || \
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

if ! zstyle -t ':zconf:module:autosuggestions' color; then
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=''
fi

bindkey -M viins "\C-F" vi-forward-word
bindkey -M viins "\C-E" vi-add-eol
