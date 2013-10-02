#mic_e's .zshrc, version 20120902/0001 3CE1.04[sft], GPLv3 or higher

#If not running interactively, don't do anything
[[ $- != *i* ]] && return

#environment variables
#utils
export VISUAL="vim"
export EDITOR=$VISUAL
export PAGER="less"
export SHELL="/bin/zsh"

#read pyrc in python shell
export PYTHONSTARTUP="$HOME/.pyrc"

#dark terminal LS colors
#todo make them a lot better
eval $( dircolors -b $HOME/.dir_colors )
#export LS_COLORS='di=01;36:ow=01;36;47:ln=01;33'
alias ls='ls --color=auto'

#general shell options
setopt extended_glob longlistjobs completeinword hashlistall bash_rematch
unsetopt autocd beep notify

#command history
HISTFILE=~/.zsh-histfile
HISTSIZE=100000
SAVEHIST=1000000
setopt append_history share_history extended_history histverify histignorespace

#do not record these in the command history
alias git status=' git status'

#directory history
alias dh=' dirs -v'
setopt autopushd pushdminus pushdsilent pushdtohome

#autocompletion (global)
zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' format '%{[1;31m%}%d%{[m%}'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' '' '' ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle ':compinstall' filename '/home/mic/.zshrc'

autoload -Uz compinit
compinit

#manpages
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

#processes
zstyle ':completion:*:processes'  command 'ps -au$USER'
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'

#urls
zstyle ':completion:*:urls' local 'www' '/var/www/' 'public_html'

# host completion, stolen from grml config
test -r ~/.ssh/known_hosts && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
test -r /etc/hosts && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
	$(hostname)
	"$_ssh_hosts[@]"
	"$_etc_hosts[@]"
	8.8.8.8
	2001:4860:4860::8888
	google.com
	127.0.0.1
	::1
	localhost
)
zstyle ':completion:*:hosts' hosts $hosts

#vcs info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' max-exports 3

zstyle ':vcs_info:*'		formats		"[%S %r/%b]"	"%s:%r/%b %S" "37"
zstyle ':vcs_info:*'		actionformats	"[%a %S %r/%b]" "%s:%r/%b %S" "1;37"

zstyle ':vcs_info:git:*'	formats		"[%S %r/%b]"	"%s:%r/%b %S" "38;5;208"
zstyle ':vcs_info:git:*'	actionformats	"[%a %S %r/%b]" "%s:%r/%b %S" "1;38;5;208"

zstyle ':vcs_info:svn:*'	formats		"[%S %r/%b]"	"%s:%r/%b %S" "38;5;212"
zstyle ':vcs_info:svn:*'	actionformats	"[%a %S %r/%b]" "%s:%r/%b %S" "1;38;5;212"

#key bindings: emacs style
bindkey -e

#history searching
bindkey "^[[A"	history-beginning-search-backward
bindkey "^[[B"	history-beginning-search-forward

bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

#special keys for several terminals
bindkey '^K'		kill-whole-line
bindkey "\e[1~"		beginning-of-line # Home
bindkey "\e[2~"		quoted-insert # Ins
bindkey "\e[3~"		delete-char # Del
bindkey "\e[4~"		end-of-line # End
bindkey "\e[5~"		beginning-of-history # PageUp
bindkey "\e[6~"		end-of-history # PageDown
bindkey "\e[7~"		beginning-of-line # Home
bindkey "\e[8~"		end-of-line # End
bindkey "\e[5C"		forward-word
bindkey "\e[5D"		backward-word
bindkey "\e\e[C"	forward-word
bindkey "\e\e[D"	backward-word
bindkey "^[[1;5C"	forward-word
bindkey "^[[1;5D"	backward-word
bindkey "\eOc"		emacs-forward-word
bindkey "\eOd"		emacs-backward-word
bindkey "\e[Z"		reverse-menu-complete # Shift+Tab
bindkey "\eOF"		end-of-line
bindkey "\eOH"		beginning-of-line
bindkey "\e[F"		end-of-line
bindkey "\e[H"		beginning-of-line
bindkey "\eOF"		end-of-line
bindkey "\eOH"		beginning-of-line

#zmv
autoload -Uz zmv

#wrapper that always performs a dry run
mmvfun() {
	{ zmv -Wn $@ | zmvhelper } || exit $?

	echo -n "[enter] to confirm..."
	if read; then
		zmv -W $@
	fi
}
alias mmv='noglob mmvfun'

#the prompt
precmd() {
	psvar[1]='36m'
	vcs_info
	psvar[2]="$vcs_info_msg_0_"
	test $vcs_info_msg_1_ && psvar[4]="$vcs_info_msg_1_" ||	psvar[4]=`pwd`
	psvar[3]="$vcs_info_msg_2_"
}

case $TERM in
	*xvt*|xterm*|gnome*|xfce*)
		PROMPT='%{[0;3%(!.1;1.2)m%}%n@%m %{[36m%}%~ %{[%v%}%(!.#.$)%{[m%} %{]2;%4v%}'
		RPROMPT='%(1j.%{[32m%}[%j]%{[m%}.)%(0?..%{[1;31;48;5;15m%}[%?]%{[m%})%{[%3vm%}%2v%{[m%}'
	;;
	*)
		PROMPT='%{[0;3%(!.1;1.2)m%}%n@%m %{[36m%}%~ %{[%v%}%(!.#.$)%{[m%} '
		RPROMPT='%(1j.%{[32m%}[%j]%{[m%}.)%(0?..%{[1;31;47m%}[%?]%{[m%})%2v'
	;;
esac

export LANG="en_US.utf8"
export LC_ALL="en_US.utf8"
