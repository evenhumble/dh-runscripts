#!/bin/sh

set -e

if tmux has-session -t=dot 2> /dev/null; then
  tmux attach -t dot
  exit
fi

tmux new-session -d -s dot -n vim -x $(tput cols) -y $(tput lines)

tmux send-keys -t dot:vim "vim -c CommandTBoot" Enter
tmux split-window -t dot:vim -h
tmux send-keys -t dot:vim.right "git st" Enter

tmux attach -t dot:vim.right
