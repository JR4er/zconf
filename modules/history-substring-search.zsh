source ${0:A:h}/history-substring-search/zsh-history-substring-search.zsh

zstyle -s ':zconf:module:history-substring-search:color' found \
	'HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND' || \
	 HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=''

zstyle -s ':zconf:module:history-substring-search:color' not-found \
	'HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND' || \
	 HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white'

zstyle -s ':zconf:module:history-substring-search' globbing-flag \
	'HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS' || \
	 HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'

if zstyle -t ':zconf:module:history-substring-search' case-sensitive; then 
	 HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS="${HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS//'i'}"
fi


if ! zstyle -t ':zconf:module:history-substring-search' color; then
	unset HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_{FOUND,NOT_FOUND}
fi

for keymap in 'emacs' 'viins'; do
	bindkey -M "$keymap" '^[[A' history-substring-search-up   # arrow up
	bindkey -M "$keymap" '^[[B' history-substring-search-down # arrow down
	bindkey -M "$keymap" '^P' history-substring-search-up # Ctrl-P
	bindkey -M "$keymap" '^N' history-substring-search-down # Ctrl-P
done

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

