#!/bin/bash -i

# for testing
#echo ""
#echo "initialising shortcuts..."
#echo ""

# Bash
# for resetting shortcuts...
alias shc="source ~/edt/shortcuts.sh"
alias vshc="vim ~/edt/shortcuts.sh"

# GIT
alias gst="git status"
alias gad="git add $1"
alias gco="git commit -m $1"
alias gac="git commit -am $1"
alias gpo="git push origin master"
alias gch="git checkout $1"


# Mercurial
alias hgl="hg log"
alias hga="hg add $1"
alias hgc="hg commit -m $1"
# alias hg="add commit?"
# alias hgp="hg push?"

alias hgs="hg serve -p 8888"


alias glog="hg log --graph -l 15 --template '[\033[1m{branch}\033[0m{if(tags,\":\")}\033[33m{tags}\033[0m{if(bookmarks,\":\")}\033[1;36m{bookmarks}\033[0m] {node|short} \033[31m{author|user}:\033[37m {desc|firstline} \033[32m({phase})\033[37m\n'"

# SVN
alias svnrm="svn status | grep "^\!" | sed -e 's/! *//' | sed -e 's/ /\\ /g' | xargs svn remove"
alias svnadd="svn status | grep "^\?" | sed -e 's/? *//' | sed -e 's/ /\\ /g' | xargs svn add"

# Grunt
alias grw="grunt watch"

# Google
google()
{
    local s="$_"
    local query=

    case "$1" in
        '')   ;;
        that) query="search?q=${s//[[:space:]]/+}" ;;
        *)    s="$*"; query="search?q=${s//[[:space:]]/+}" ;;
    esac

    /opt/google/chrome/google-chrome "http://www.google.com/${query}"
}

alias gbr="/opt/google/chrome/google-chrome ./" 


# Mysql

# msqldump <db name>
# asks for password
# outputs <db name>-<timestamp>.dump
function mdump() {
    if [ $# -lt 1 ]; then
        echo 1>&2 "$0: not enough arguments"
    else
        timestamp=$(date +%s)
        mysqldump -uroot -p$2 --opt $1 > $1-$timestamp.dump
    fi
}



# Browse and edit tools
## cx = CD filename*
## xc = CD *filename
## vx = VIM filename*
## xv = VIM *filename

## cx - cd wildcard [filename*]
cx()
{
    local s="$*"
    local wildcard=
    
    case "$1" in
        '')   s='' ;;
        *)    s="$*" ; wildcard="${s}*";;
    esac

    cd ${wildcard}
}

## xc - cd wildcard [*filename]
xc()
{
    local s="$*"
    local wildcard=
    
    case "$1" in
        '')   s='' ;;
        *)    s="$*" ; wildcard="*${s}";;
    esac

    cd ${wildcard}
}

## vx - vim wildcard [filename*]
vx()
{
    local s="$*"
    local wildcard=
    
    case "$1" in
        '')   s='' ;;
        *)    s="$*" ; wildcard="${s}*";;
    esac

    vim ${wildcard}
}

## xv - cd wildcard [*filename]
xv()
{
    local s="$*"
    local wildcard=
    
    case "$1" in
        '')   s='' ;;
        *)    s="$*" ; wildcard="*${s}";;
    esac

    vim ${wildcard}
}


#kilt()
#{
#    kill $(ps ax | grep 'ssh db[0-9]' | awk '{print $1}')
#}

# erun <app folder>
function erun() {
    $1/manage.py runserver 0.0.0.0:8000
}

function msqlr() {
    mysql -uroot -p$1
}

function makereqs() {
    if [ -f requirements.old ]; then
        rm -f requirements.old
    fi

    mv requirements.txt requirements.old
    pip freeze > requirements.txt
}

