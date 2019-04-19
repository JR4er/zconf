# color
zstyle ':zconf:*:*' color 'yes'

# case sensitive for completion history lookup
zstyle ':zconf:*:*' case-sensitive 'yes'

# zsh module load
# zmodload zsh/attr zsh/stat

# zsh function to load
autoload zargs zmv

# zconf module to load
zstyle ':zconf:mod' load \
	'environment' \
	'editor' \
	'history' \
	'utility' \
	'completion' \
	'syntax-highlighting' \
	'history-substring-search' \
	'autosuggestions' \
	'prompt'

# configuration

zstyle ':zconf:module:prompt' theme 'purest'
zstyle ':zconf:module:editor' key-bindings 'vi'
#zstyle ':zconf:module:history-substring-search' color 'no'
