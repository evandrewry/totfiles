export PATH="$PATH:~/.bin"

# set options for less
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
# or the short version
# export LESS='-F -i -J -M -R -W -x4 -X -z-4'


# Set colors for less. Borrowed from https://wiki.archlinux.org/index.php/Color_output_in_console#less .
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

if ls --color -d . >/dev/null 2>&1; then  # GNU ls
  export COLUMNS  # Remember columns for subprocesses.
  eval "$(dircolors)"
  function ls {
    command ls -F -h --color=always -v --author --time-style=long-iso -C "$@" | less -R -X -F
  }
  alias ll='ls -l'
  alias l='ls -l -a'
fi

 . /usr/local/etc/profile.d/z.sh


 rmd() {
  pandoc $1 | lynx -stdin
 }
