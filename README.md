# totfiles 

## tyler's dotfiles

### vim 

what's checked in is a copy sans the plugged dir of `homesick clone git://github.com/technicalpickles/pickled-vim.git`

+ .vimrc, which should/can be .vimrc.local

### brew casks etc. 

`xargs brew (cask) install < Brew(casks)file`

### .inputrc

my new fav dotfile

[see here](https://www.topbug.net/blog/2017/07/31/inputrc-for-humans/)

```
# from https://www.topbug.net/blog/2017/07/31/inputrc-for-humans/

# $include /etc/inputrc: This line carries over site-wide readline configuration to the user configuration. Usually /etc/inputrc includes some goodies.
$include /etc/inputrc

# ctrl-n = forward, ctrl-p = backward
"\C-p":history-search-backward
"\C-n":history-search-forward

# tell readline to display { if possible } diff colors
set colored-stats On

# ignore cases
set completion-ignore-case On

# completions ellipses after 10 chars
set completion-prefix-display-length 10

# sets every completion which is a symbolic link to a directory to have a slash appended.
set mark-symlinked-directories On

#  This line sets the completions to be listed immediately instead of ringing the bell, when the completing word has more than one possible completion.
set show-all-if-ambiguous On

# when the completing word has more than one possible completion but no partial completion can be made.
set show-all-if-unmodified On

# sets completions to be appended by characters that indicate their file types reported by the stat system call.
set visible-stats On
```

# the rest

- vscode stuff is a gist 
- only checked in this homeshick in case of change { so good, it is }, you should download homeshick & clone it etc.
