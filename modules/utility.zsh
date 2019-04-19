# correct commands
setopt CORRECT

# disable correction
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias gcc='nocorrect gcc'
alias clang='nocorrect clang'
alias grep='nocorrect grep'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias rm='nocorrect rm'

# disable globbing
alias fc='noglob fc'
alias find='noglob find'
alias history='noglob history'
alias locate='noglob locate'
alias rake='noglob rake'
alias rsync='noglob noremoteglob rsync'
alias scp='noglob noremoteglob scp'
alias sftp='noglob sftp'

# general alias
alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias rmi="${aliases[rm]:-rm} -i"
alias mvi="${aliases[mv]:-mv} -i"
alias cpi="${aliases[cp]:-cp} -i"
alias lni="${aliases[ln]:-ln} -i"

if zstyle -T ':zconf:module:utility' safe-ops; then
	alias rm='rmi'
	alias mv='mvi'
	alias cp='cpi'
	alias ln='lni'
fi

if (( $+commands[exa] )); then
	if zstyle -t ':zconf:module:utility:ls' color; then
		alias ls="exa"
	else
		alias ls="${aliases[ls]:-ls} -F"
	fi
else
	if zstyle -t ':zconf:module:utility:ls' color; then
		export LSCOLORS='exfxcxdxbxGxDxabagacad'
		export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
		alias ls="${aliases[ls]:-ls} -G"
	else
		alias ls="${aliases[ls]:-ls} -F"
	fi
fi

if zstyle -t ':zconf:module:utility:grep' color; then
	export GREP_COLOR='37;45'
	export GREP_COLORS="mt=$GREP_COLOR"
	alias grep="${aliases[grep]:-grep} --color=auto"
fi

function noremoteglob {
	local -a argo
	local cmd="$1"
	for arg in ${argv:2}; do case $arg in
		( ./* ) argo+=( ${~arg} ) ;; # local relative, glob
		(  /* ) argo+=( ${~arg} ) ;; # local absolute, glob
		( *:* ) argo+=( ${arg}  ) ;; # remote, noglob
		(  *  ) argo+=( ${~arg} ) ;; # default, glob
	esac; done
	command $cmd "${(@)argo}"
}
