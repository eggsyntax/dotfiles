# Executed by all non-interactive shells
# For mac: see http://lists.apple.com/archives/macos-x-server/2008/Jun/msg00251.html
# My .bash_profile just sources this.

# Don't forget that https://github.com/koalaman/shellcheck is a thing!

alias l="ls -G "
alias ltr="ls -ltr "
alias dir="ls -lG "
alias grep='grep --color=auto'

alias tf='less +F' # better than tail -f
alias serve='python -m SimpleHTTPServer' # Must be followed by a port of your choice.

# Quick alias to edit then source .bashrc
function rc {
    vi ~/.bashrc
    . ~/.bashrc
}

# see also LESSOPEN below
export LESS=' -R '

# Clojure
alias lr="lein repl :start :port 6666"
# Speed up leiningen start time:
export LEIN_FAST_TRAMPOLINE=y

# generate ctags (run from root dir of project)
alias cljtags='find . -type f -iname "*.clj" | xargs ctags -a'

# Note that the excludes here may change by system.
function fn {
    find . -name '*.pyc' -prune -o -name '*.rst' -prune -o -name "$1*" -print
}

function ifn {
	  find . -name '*.pyc' -prune -o -name '*.rst' -prune -o -iname "$1*" -print
}

# TODO change the hardcoded IP address once I have things working
# Acceptable values 0.0 - 10.0 (maybe more, dunno)
function vol {
    ssh 192.168.1.222 "osascript -e \"set Volume $1\"" 2>/dev/null
}

# Change prompt color if currently sshed.
# It was a fun idea, but doesn't work because it's the prompt in the ssh that matters
# function ssh-with-prompt {
#   sshprompt="\n\[\033[48;5;0m\]\[\033[38;5;51m\]\u@\h>\[$(tput sgr0)\]"
#   oldprompt=$PS1
#   export PS1=$sshprompt
#   /usr/bin/ssh $@ # Call the real ssh
#   echo "step 1"
#   export PS1=$oldprompt
#   echo "PS1 is now $PS1"
#   echo "step 2"
#   }
# alias ssh=ssh-with-prompt

# Start the Emacs GUI App, aka Emacs.app (installed by homebrew spacemacs)
alias spacemacs='emacs &'

# Send a custom process-interrupt to each spacemacs instance -- it'll interrupt
# whatever's freezing it, and cause it to drop to the debugger.
function sminterrupt {
    local processes=`ps aux | grep emacs | grep -v grep | grep -v gpg-agent | awk ' {print $2} '`
    kill -USR2 $processes
 }

# Map ctrl-x/c/v to work as system clipboard cut/copy/paste
#nnoremap <C-x> "*d
#nnoremap <C-c> "*y
#nnoremap <C-v> "*p

# Always a pain to remember the youtube-dl options. Extract audio:
alias youtube-audio="youtube-dl -x --audio-format mp3 --restrict-filenames --no-mtime --no-playlist --audio-quality 2 "

# Weather in the terminal, because why the hell not?
# TODO consider improving colors: https://github.com/chubin/wttr.in/issues/11
alias weather="curl wttr.in/asheville | sed -e 's/38;5/1;38;5/g' -e 's:226m:202m:g'"
alias moon="curl wttr.in/Moon | sed -e 's/38;5/1;38;5/g' -e 's:226m:202m:g'"

################ Begin git stuff ###################
export sth="stash@{0}" # less annoying to type

alias st="git status"
alias gd="git diff -w"
alias gg='git grep'
alias gi='git grep -i'
# For times when I don't want a pager
alias ggn='git --no-pager grep'
# Show files changed in each commit:
alias changes='git log --pretty=oneline --abbrev-commit --graph --stat'
# alias recentbranches="git for-each-ref --sort=committerdate --format='%(committerdate:short) %(refname)' refs/heads"
alias recentbranches="git for-each-ref --sort=committerdate --format='%(committerdate:short) %(refname)' refs/heads | sed 's/refs\/heads\///'"
alias todos='gg -A 2 -e TODO -e THINK -e FIXME'
alias todos-untracked='gg --untracked -e TODO -e THINK -e FIXME'
alias prints-untracked='gg --untracked -e println'
# alias todos-by-person='git ls-tree -r -z --name-only HEAD -- */* | xargs -0 -n1 git blame -f | grep -e TODO -e THINK' -e FIXME
# alias todos-mine='todos-by-person | grep "Egg "'
# alias prints-by-person='git ls-tree -r -z --name-only HEAD -- */* | xargs -0 -n1 git blame -f | grep println'
# alias prints-mine='prints-by-person | grep "Egg "'

# to show changes only in branch: hard to alias, but just do
# git diff master...mybranch

alias todos-mine='git grep -l -e TODO -e THINK . | xargs -n1 git blame -f -n -w | grep "$(git config user.name)" | grep -e TODO -e THINK | sed "s/.\{9\}//" | sed "s/(.*)[[:space:]]*//"'
alias prints-mine='git grep -l println . | xargs -n1 git blame -f -n -w | grep "$(git config user.name)" | grep -e println | sed "s/.\{9\}//" | sed "s/(.*)[[:space:]]*//"'
alias td='todos-mine'

function newbranch {
    git checkout -b $1
    git push -u origin $1
}

function cleanmerged {
    # Delete any local branches (besides master) which have been merged to master
    git branch --merged | grep -v '^* master$' | grep -v '^  master$' | xargs git branch -d
}

function fetchbranch {
    # Sync a branch without checking it out. 1st arg is branch.
    # 2nd arg is upstream name (default 'origin').
    default_upstream=origin
    upstream=${2-$default_upstream}
    # Note that the `fetch a:b` does update b, which can be a bit surprising
    # given the more typical use of fetch.
    git fetch $upstream $1:$1
}

# Show set of unique branch prefixes
alias show-branchtypes='git branch -r | sed 's#origin/##' | grep '\/' | sed 's#/.*##' | uniq'

alias here='git grep YOUAREHERE | cat'
alias gdm='git diff master --name-status'

# Outdated
#alias branchlog='git log --first-parent --no-merges'

# http://stackoverflow.com/a/12142066
# Show commits that only exist on the current branch
# TODO: I'd like to have branchname be $1 if given, otherwise as below
function branchlog {
    branchname=`git rev-parse --abbrev-ref HEAD`
    git log $branchname --not $(git for-each-ref --format='%(refname)' refs/heads/ | grep -v "refs/heads/$branchname")
}

################ End git stuff ###################

function snitchless {
    # Can't run stuff over ssh if it requires Little Snitch approval. So
    # we call with snitchless to allow it. eg
    # $ curl mysite.com
    # becomes
    # $ snitchless curl mysite.com
    $@ | osascript ~/bin/snitch-allow.scpt
}

############### id3 tags #############################

alias id3='id3v2 -l'

# Call w/ no args
alias variousize='id3v2 --TPE2 "Various Artists" *mp3'

############### File conversion stuff: ###############
function mp3ize-one {
    # Convert a file to v0 mp3 using ffmpeg
    # We get the name without the final extension so we can rename to .mp3
    basename=` echo "$1" | perl -pe "s/(.*)\..*$/\1/" `
    ffmpeg -i "$1" -qscale:a 0 "$basename.mp3"
}

function mp3ize {
    # Convert any number of files to mp3
    # Call as, eg, "mp3ize *.flac"
    # Caller is responsible for only sending audio files, otherwise spurious
    # mp3 files may result for, eg, log files
    for i in "$@"
    do
        mp3ize-one "$i"
    done
}

function cdr-to-iso {
    # Disk utility will convert dmg to cdr, but we usually want an iso
    # untested, but _should_ work...deletes cdr file afterward
    hdiutil makehybrid -iso -joliet -o "$1.iso" $1
    rename 's/\.cdr//' "$1.iso"
    rm $1
}

############### End file conversion stuff: ###############

#-+ why? see http://folk.uio.no/steikr/doc/python/ipython/node2.html
# The above link seems to have vanished, and I don't know anymore why I was doing this.
# alias ipy="pythonw `which ipython`"

alias more="less -i"
alias preview="qlmanage -p"

# vi bindings at the command line
# (now handled instead by having `set editing-mode vi` in .inputrc )
# see http://vim.wikia.com/wiki/Use_vi_shortcuts_in_terminal
# set -o vi

# Get rid of duplicate mp3s in a directory:
alias rmdupes='find . -name "* 1.mp3" -exec rm {} \;'

# Open lynx:
alias lynx="/Applications/Lynxlet.app/Contents/Resources/lynx/bin/lynx"

# Show all procs owned by me
alias myprocs='ps -ef | grep `whoami`'

# Show all devices on the network & their IP addresses (ping broadcast address 1st)
alias net-devices='ping -c 1 192.168.1.255 && arp -a'

# My most common grep function:
function gr { grep -rl "$1" * | grep -v '.pyc'; }
export -f gr

# And a case-insensitive version
function igr { grep -irl "$1" * | grep -v '.pyc'; }
export -f igr

# I often want to remember how to run something a bunch of times and can't remember how
function runit {
    number=$1
    shift
    for i in `seq $number`; do
        $@
    done
}

# Set prompt
# This should be copied into .local-bashrc and the number (setaf _) changed for unique
# color per-box
# Can generate prompts at http://bashrcgenerator.com/
if [[ $- == *i* ]]; then # if in interactive terminal (else tput breaks)
    prompt="\n\[$(tput bold)\]\[$(tput setaf 5)\]\W> \[$(tput sgr0)\]"
    export PS1=$prompt
fi


###################   PATH   ######################

# And a local /bin and /script are nice.
PATH="${HOME}/bin:${HOME}/scripts:${PATH}"

export PATH

##################   OPTIONS    ####################

# make history function sanely
shopt -s histappend
export PROMPT_COMMAND='history -a'
# Unlimited history size
# On bash < 4.3 (ie mac), This should be blank instead of -1.
# (or bash will BREAK!)
export HISTSIZE=-1
export HISTFILESIZE=-1
# Ignore duplicate commands, and commands with leading whitespace
export HISTCONTROL=ignoreboth
# Show datetime in `history`
export HISTTIMEFORMAT="%m/%d/%y %T "


# Autocorrect minor typos (in cd only)
shopt -s cdspell

# tab-complete files if case is wrong
set completion-ignore-case on

# Handle config stuff that's specific to this computer:
if [ -f ~/.local-bashrc ]; then
    source ~/.local-bashrc
fi

export NVM_DIR="/Users/egg/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Overridden on at least one system
alias figwheel='LEIN_FAST_TRAMPOLINE=y rlwrap lein trampoline figwheel "$@"'

# Datomic (fragile because hardcoded stuff)
alias dat-transactor="cd ~/datomic* && bin/transactor config/samples/dev-transactor-template.properties"
alias dat-console="cd ~/datomic* &&  bin/console -p 9000 dev datomic:dev://localhost:4334/"

# convenience alias for starting Blender (if installed)
# (must run from cmd line to see python (& other) logs)
alias blender='cd /Applications/blender.app/Contents/MacOS && ./blender'

# export DISPLAY for ssh
# export DISPLAY=:0.0

# fuzzy finder -- I haven't actually liked it that much.
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# what computer am I using?
alias whereami='echo `uname -n` "(" `uname` ")"'

# NOTE! sub works on mac, but only after running `brew install gnu-sed --with-default-names`

alias sub='sed -i --'

# Show 1st-level subdirs by size:
alias dirsizes='du -BM --max-depth 1 2>/dev/null | sort -n'

######### Mac-specific ########

# "How to alter system-wide $PATH for non-interactive, non-login bash shells invoked via sshd?"
# see http://lists.apple.com/archives/macos-x-server/2008/Jun/msg00251.html

function mac-bashrc {

    if [[ $- == *i* ]]; then # if in interactive terminal (else tput breaks)
        echo "Executing mac bash startup"
    fi

    # Should be -1 (see above) on bash >= 4.3, aka non-mac
    export HISTSIZE=
    export HISTFILESIZE=

    alias v="/Applications/MacVim.app/Contents/MacOS/Vim" #TODO mac-specific
    alias vm="/usr/local/bin/mvim" # See vm below
    alias ec="open -a Eclipse"
    alias topp='top -o cpu'

    # Show/hide hidden files quickly.
    # Required some changes as of OS X 10.9. http://apple.stackexchange.com/a/64481
    alias hiddenyes='defaults write com.apple.finder AppleShowAllFiles -bool true; killall Finder /System/Library/CoreServices/Finder.app'
    alias hiddenno='defaults write com.apple.finder AppleShowAllFiles -bool false; killall Finder /System/Library/CoreServices/Finder.app'

    # Support gnu highlighting. Must install it:
    alias dockerterm=". '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"

    # Make tkdiff available ( http://www.gitguys.com/topics/merging-with-a-gui/ )
    alias tkdiff="/Applications/TkDiff.app/Contents/MacOS/tkdiff" #TODO mac-specific

    # Show startup items in all the Mac startup dirs
    # See https://apple.stackexchange.com/questions/19319/managing-and-removing-startup-processes-on-osx-lion
    alias startup_items='{ ls /Library/StartupItems & ls ~/Library/StartupItems & ls /Library/LaunchDaemons & ls ~/Library/LaunchAgents; } | sort'

    #TODO some of these are mac-only!
    # Give /usr/local/bin precedence over /usr/bin (for homebrew)
    PATH="/usr/local/bin:${PATH}"

    # Add git path
    PATH="/usr/local/git/bin:${PATH}"

    # Add GNU coreutils precedence over mac versions:
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

    export PATH

    # keychain -- make a single ssh-agent per login session (& inherit mac keychain keys)
    # http://www.funtoo.org/Keychain
    eval `keychain --eval --agents ssh --inherit any id_rsa 2> /dev/null`

    # If you open a file in vim on the command line, then open the same file
    # again, the second one will give you an error message to the effect of
    # "Swap file already exists. Edit Anyway, Recover, Quit, Open Read-Only, Abort?"
    # This function (ab)uses vim's client-server architecture so that it will
    # instead bounce you to the existing window, or open a new window if none exists.
    # Bonus speed boost, too.

    # TODO this appears to be broken on Mavericks, so I'm ditching it for the moment.
    function vm-bak {
        VIM="/usr/bin/env mvim" # Change to suit your (client-server-friendly) vim
        # We need absolute filepath so that calling the same file from two different
        # locations will be understood as belonging to the same server.
        # Could have been done more simply with realpath or readlink, but neither
        # is available on all *nix systems.
        ABSPATH="$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
        $VIM --servername $ABSPATH --remote-silent $1
    }

    # Open a file in a new emacs window (server must be running)
    # Called in subshell to silence job control, and send to /dev/null to
    #    silence the 'Waiting for Emacs...' output. Fall back to macvim if
    #    server is not running.
    # (alternate approach: start the server, sleep a few secs, then run)
    function em {
        ( /usr/local/bin/emacsclient -c -a /usr/local/bin/mvim -n "$@" >/dev/null & )
    }

    ################ RabbitMQ ########################

    # TODO move to .local-bashrc
    alias rmq-restart='brew services restart rabbitmq'

    ################ End RabbitMQ ####################

    # Some extra bash completion:
    eval "$(stack --bash-completion-script stack)"

    # Load autojump
    # ie 'j foo' takes you to fuzzy-matched foo directory
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

    # Create cd history function (cd --, cd -3)
    source ~/.cd_history.sh

    # Set JAVA_HOME
    # export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_74.jdk/Contents/Home"

}

######### Linux-specific ########

function linux-bashrc {
    if [[ $- == *i* ]]; then # if in interactive terminal (else tput breaks)
        echo "Executing linux bash startup"
    fi

    alias v='vim'

    # Open a file in a new emacs window (server must be running)
    # Called in subshell to silence job control, and send to /dev/null to
    #    silence the 'Waiting for Emacs...' output. Fall back to vim if
    #    server is not running.
    # (alternate approach: start the server, sleep a few secs, then run)
    function em {
        # TODO temp: don't send to /dev/null until I know things are working well
        # ( /usr/bin/emacsclient -c -a /usr/bin/vim -n "$@" >/dev/null & )
        ( /usr/bin/emacsclient -c -a /usr/bin/vim -n "$@" >/dev/null & )
    }

    # Load autojump
    # ie 'j foo' takes you to fuzzy-matched foo directory
    # WRONG? . /usr/share/autojump/autojump.sh
    . /usr/share/autojump/autojump.bash

    # TODO do I need this in linux?
    # Set JAVA_HOME
    # export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
    # export JAVA_HOME=""

    # like pbcopy on mac -- pipe it input & it goes to the clipboard
    alias clip='xsel --clipboard --input'

    # Set ctrl keys to produce parens:
    # Only ever want one xcape running at a time:
    # MOVED to /etc/rc.local
    # killall xcape || true # the || true is to capture the error if none are running.
    # xcape -e 'Control_L=Shift_L|parenleft;Control_R=Shift_R|parenright'

    export EDITOR='vim'
    export VISUAL='vim'

    # Create cd history function (cd --, cd -l, cd -3)
    # https://github.com/bulletmark/cdhist
    source /etc/cdhist.bashrc

    # Color etc -- copypasted from web, not really vetted.
    # More info at https://ubuntuforums.org/showthread.php?t=41538
    export TERM=xterm-color
    # GREP_OPTIONS is deprecated
    # export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    if [ "$TERM" != "dumb" ]; then
        [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
        [ -e "$DIR_COLORS" ] || DIR_COLORS=""
        eval "`dircolors -b $DIR_COLORS`"
        alias ls='ls --color=auto'
        alias l='ls --color=auto'
        alias dir='ls --color=auto --format=vertical'
        #alias vdir='ls --color=auto --format=long'
    fi

    export LESSOPEN='|~/.lessfilter %s'

    # Use bash-completion, if available
    [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
        . /usr/share/bash-completion/bash_completion

    alias top=htop

    # tmuxinator. See https://github.com/tmuxinator/tmuxinator
    # TODO can I move this to OS-agnostic?
    source ~/bin/them/tmuxinator.bash

    alias upgrade='sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove'

    # Add path for Cask (emacs) - https://github.com/cask/cask
    PATH="${PATH}:${HOME}/.cask/bin"
    export PATH

}


unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    linux-bashrc;
elif [[ "$unamestr" == 'Darwin' ]]; then
    mac-bashrc;
else echo "PLATFORM UNKNOWN! Check output of uname";
fi
