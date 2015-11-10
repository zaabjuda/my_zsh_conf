#!/bin/zsh
# vim: set filetype=zsh

alias grep='grep --color=auto'

alias -s {avi,mpeg,mpg,mov,m2v}=smplayer
alias -s {odt,doc,sxw,rtf}=openoffice.org
alias -s {pdf,djvu}=evince
alias -s {jpg,png,svg,xpm,bmp}=gpicview
alias -s {txt,py,ini,yaml,pid,conf,cnf,config}=vim

[[ -z $DISPLAY ]] && {
 alias -s {png,gif,jpg,jpeg}=fbv
 alias -s {pdf}=apvlv
} 

autoload -U pick-web-browser
alias -s {html,htm,xhtml}=pick-web-browser
if [[ $PLATFORM == 'macosx' ]]; then
	grc_path='/usr/local/bin/grc'
else
        grc_path='/usr/bin/grc'
fi
if [ -f $grc_path ]; then
    alias grc='grc --colour=auto'
    alias ping='grc ping'
    alias last='grc last'
    alias netstat='grc netstat'
    alias traceroute='grc traceroute'
    alias make='grc make'
    alias gcc='grc gcc'
    alias configure='grc ./configure'
    alias cat="grc cat"
    alias tail="grc tail"
    alias head="grc head" 
    alias git="grc git"
fi
unset grc_path

if which rsync >/dev/null; then
    alias rcp='rsync -aP'
fi

if [[ $PLATFORM == 'linux' ]]; then
	alias ls='ls --classify --color --human-readable --group-directories-first'
	alias cp='nocorrect cp --interactive --verbose --recursive --preserve=all'
	alias mv='nocorrect mv --verbose --interactive'
	alias rm='nocorrect rm -Irv'
	alias sudo='nocorrect sudo'
	alias du='du --human-readable --total'
	alias df='df --human-readable'
	alias nohup='nohup > /dev/null $1'
	alias s='nocorrect sudo'
	alias v='vim'
	alias sv='sudo vim'
	alias sk='sudo killall'
	alias rm='rm -v'
	alias mv='mv -v'
	alias k='killall' 
	alias killall="killall --interactive --verbose"
	alias free="free -t -m"
	alias git="nocorrect git"
	alias scrot="scrot --border --count --quality 75 $HOME'/%d-%b-%y_%H-%M-%S_\$wx\$h.png' --exec 'du -h \$f'"
	alias aptitude="sudo aptitude"
	alias ifconfig="sudo ifconfig"
	alias logo="exit"
	alias ex="exit"
	alias i="grep"
	alias less='zless'
elif [[ $PLATFORM == 'macosx' ]]; then
        alias ls='gls --classify --color --human-readable --group-directories-first'
        alias cp='nocorrect gcp --interactive --verbose --recursive --preserve=all'
        alias mv='nocorrect gmv --verbose --interactive'
        alias rm='nocorrect grm -Irv'
        alias sudo='nocorrect sudo'
        alias du='gdu --human-readable --total'
        alias df='gdf --human-readable'
        alias nohup='nohup > /dev/null $1'
        alias s='nocorrect sudo'
        alias v='vim'
        alias sv='sudo vim'
        alias sk='sudo killall'
        alias rm='grm -v'
        alias mv='gmv -v'
        alias k='killall'
        alias killall="killall -v"
        #alias free="free -t -m"
        alias git="nocorrect git"
        alias scrot="scrot --border --count --quality 75 $HOME'/%d-%b-%y_%H-%M-%S_\$wx\$h.png' --exec 'du -h \$f'"
        alias ifconfig="sudo ifconfig"
        alias logo="exit"
        alias ex="exit"
        alias i="grep"
        alias less='zless'
fi

# Inline aliases, zsh -g aliases can be anywhere in command line
alias -g G='| grep -e'
alias -g L='| zless'
alias -g clean='egrep -v "^\s*$|^;|^\s*#"'

if [[ $PLATFORM == 'linux' ]]; then
	alias upgrade='sudo apt-get update && sudo apt-get upgrade'
	alias pkgsearch='apt-cache search'
	alias pkginfo='dpkg -s'
	alias pkginst='dpkg --get-selections | grep'
	alias pkgremove='sudo apt-get remove'
	alias pkgpurge='sudo apt-get purge'
	alias pkgclean='sudo apt-get autoclean'
fi
alias tmux="tmux_run"
