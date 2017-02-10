#!/bin/bash
# Check fi running
ps auxw | grep optiminer | grep -v grep > /dev/null

if [ $? != 0 ]
#if not, then start
then
     /usr/bin/tmux new-session -d /home/cristian/optiminer-zcash/mine.sh
fi

#end