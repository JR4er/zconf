HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}"/zsh/zhistory 
HISTSIZE=10000
SAVEHIST=10000

setopt BANG_HIST		# treat ! specially
setopt EXTENDED_HISTORY		# write history :start:elapsed;command
setopt INC_APPEND_HISTORY	# write history immediately
setopt SHARE_HISTORY		# share history in all sessions
setopt HIST_EXPIRE_DUPS_FIRST	# expire duplicate event first
setopt HIST_IGNORE_DUPS		# do not record just again
setopt HIST_IGNORE_ALL_DUPS	# ignore all the duplicate commands
setopt HIST_FIND_NO_DUPS	# do not display a previously found event
setopt HIST_IGNORE_SPACE	# ignore command starting with space
setopt HIST_SAVE_NO_DUPS	# do not write duplicate command to file
setopt HIST_VERIFY		# verify before execute
setopt HIST_BEEP		# beep when accessing non-existent history

alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
