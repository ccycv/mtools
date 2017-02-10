# mtools
Miner tools
I have made the following scripts because my miner crash after few hours/days.


If something wrong with the miner, then kill and reboot:

vim /home/yourusername/optiminer-zcash/watchdog-cmd.sh

echo "Uncomment any of the actions in 'watchdog-cmd.sh' to perform on stuck GPU!"
#========Start=======
#Kill if somthing wrong
PID=`ps -eaf | grep optiminer | grep -v grep | awk '{print $2}'`
if [[ "" !=  "$PID" ]]; then
  echo "killing $PID"
  kill -9 $PID
fi


## Reboot:

/sbin/shutdown -r now
#=======END=========


This script will start the miner in a tmux session if not running:

chmod +x /home/yourusername/optiminer-zcash/watchdog-cmd.sh

Create script startminer.sh with the following content :

touch /home/yourusername/startminer.sh
vim   /home/yourusername/startminer.sh

======START=======
#!/bin/bash
# Check fi running
ps auxw | grep optiminer | grep -v grep > /dev/null

if [ $? != 0 ]
#if not, then start
then
     /usr/bin/tmux new-session -d /home/cristian/optiminer-zcash/mine.sh
fi

#end
=======END========

This cron job will execute the startminer.sh on every 5 minute

chmod +x /home/yourusername/startminer.sh

Add the following job in crontab 

*/5 * * * * /bin/sh /home/youusername/startminer.sh


In order to check your miner just exectue the following command :

See tmux sessions :
# tmux list-sessions
Attach to the session
# tmux a
Detach from session 
ctrl+b c


I hope this will help some miners.
