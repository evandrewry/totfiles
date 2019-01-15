rvm default

function reverse_history_search
  history | fzf --no-sort | read -l command
  if test $command
    commandline -rb $command
  end
end
bind \cr reverse_history_search

set -g -x PATH $PATH /usr/bin /bin /usr/sbin /sbin /Users/tyler/npm-global/lib/node_modules/ /Users/tyler/npm-global/bin
