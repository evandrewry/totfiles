[ -f /usr/local/share/autojump/autojump.fish ]

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

#################################
### Network Related
#################################

alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ and print $1'"
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

function sss --description "Start an HTTP server from a directory"
 live-server --port=8080; open http://localhost:8080/ -a Firefox
end

# function httpcompression
  # curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' $argv | grep '^Content-Encoding:'
  # and echo "$argv is encoded using ${encoding#* }"
  # or echo "$argv is not using any encoding"
# end

function digga --description "All the dig info"
  dig +nocmd $argv[1] any +multiline +noall +answer
end

alias myip="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"

################################
###  Unix Related
################################

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

function md
  mkdir -p "$argv"; cd "$argv"
end

function imsg --description "send imessage to my myself"
  osascript -e "tell application \"Messages\" to send \"$argv\" to buddy \"Tyler Sayles\""
end

function randpw --description "generate a random password"
  dd if=/dev/urandom bs=1 count=16 2>/dev/null | base64 | rev | cut -b 2- | rev
end

function cd --description "auto ls for each cd"
  if [ -n $argv[1] ]
    builtin cd $argv[1]
    and ls -AF
  else
    builtin cd ~
    and ls -AF
  end
end

function lsall --description "list all commands in column format"
  ls $PATH | column | less
end

function pkill --description "pkill a process interactively"
  ps aux | peco | awk '{ print $2 }' | xargs kill
end

function ppkill --description "kill -9 a process interactively"
  ps aux | peco | awk '{ print $2 }' | xargs kill -KILL
end

function pgrep --description "pgrep a process interactively"
  ps aux | peco | awk '{ print $2 }'
end

function rename --description "Rename a symbol recursively in a folder"
    rg -l "$argv[1]" | xargs -I\{\} perl -i -pe "s/$argv[1]/$argv[2]/g" \{\}
end

################################
###  For Python
################################

function gpip
  env PIP_REQUIRE_VIRTUALENV='' pip $argv
end

################################
###  Mac OS Related
################################

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# Empty the Trash
alias emptytrash="rm -rfv ~/.Trash"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true and killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false and killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false and killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true and killall Finder"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

function posix-source
	for i in (cat $argv)
		set arr (echo $i |tr = \n)
  		set -gx $arr[1] $arr[2]
	end
end

alias ..="cd .."
alias ...="cd ../.."

alias la="ls -Gla"
alias lsd='ls -l | grep "^d"'
alias ll='ls -ahlF'
alias l='ls -CF'

################################
###  File ShortCut
################################
alias D="cd ~/Downloads"
alias d="cd ~/workspaces/dropbox"
alias p="cd ~/avfiles/vfiles-shop"
alias g="git"

################################
###  Program ShortCut
################################

# git related shortcut
alias undopush="git push -f origin HEAD^:master"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gca="git commit -a -m"
alias gcm="git commit -m"
alias gbd="git branch -D"
alias gst="git status -sb --ignore-submodules"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
alias grs="git reset --soft"
alias grh="git reset --hard"
alias gb="git branch"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gba="git branch -a"
alias gcp="git cherry-pick"

# NODE
#This package has installed:
# Node.js v10.13.0 to /usr/local/bin/node
# npm v6.4.1 to /usr/local/bin/npm
#Make sure that /usr/local/bin is in your $PATH.
#Warning: Homebrew's sbin was not found in your PATH but you have installed
#formulae that put executables in /usr/local/sbin.
#Consider setting the PATH for example like so

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/bin" $fish_user_paths

# npm packages not being recognized? 
set -g fish_user_paths "/usr/local/npm_packages/bin" $fish_user_paths

set -g fish_default_key_bindings







