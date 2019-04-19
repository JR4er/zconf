# Browser

if [[ "$OSTYPE" == darwin* ]]; then
	export BROWSER='open'
fi

# Editors
export EDITOR='vi'
export VISUAL='vi'
export PAGER='less'

# Language
if [[ -z "$LANG" ]]; then
	export LANG='en_US.UTF-8'
fi

# Path
# ensure arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path
path=(/usr/local/{bin,sbin} $path)

# LESS
export LESS='-F -g -i -M -R -S -w -X -z-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
	export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
