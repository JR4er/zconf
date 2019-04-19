# smart urls
if [[ ${TERM} != "dumb" ]]; then
	autoload -Uz bracketed-paste-url-magic
	zle -N bracketed-paste bracketed-paste-url-magic
	autoload -Uz url-quote-magic
	zle -N self-insert url-quote-magic
fi

# general
setopt COMBINING_CHARS		# combine zero-length punctuation characters
setopt INTERACTIVE_COMMENTS	# enable comments in interactive shell
setopt RC_QUOTES		# double ' to escape
unsetopt MAIL_WARNING		# don't print warning message if mail accessed

# jobs
setopt LONG_LIST_JOBS		# list jobs in the long format
setopt AUTO_RESUME		# try resume existing job before a new process
setopt NOTIFY			# report status of background job immediately
unsetopt BG_NICE		# don't run all background jobs at low priority
unsetopt HUP			# don't kill jobs on shell exit
#unsetopt CHECK_JOBS		# don't report on jobs when shell exit

if zstyle -t ':zconf:environment:termcap' color; then
	export LESS_TERMCAP_mb=$'\E[01;31m'      # begins blinking.
	export LESS_TERMCAP_md=$'\E[01;31m'      # begins bold.
	export LESS_TERMCAP_me=$'\E[0m'          # ends mode.
	export LESS_TERMCAP_se=$'\E[0m'          # ends standout-mode.
	export LESS_TERMCAP_so=$'\E[00;47;30m'   # eegins standout-mode.
	export LESS_TERMCAP_ue=$'\E[0m'          # ends underline.
	export LESS_TERMCAP_us=$'\E[01;32m'      # begins underline.
fi
