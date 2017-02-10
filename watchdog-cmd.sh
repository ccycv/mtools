#Kill if somthing wrong
PID=`ps -eaf | grep optiminer | grep -v grep | awk '{print $2}'`
if [[ "" !=  "$PID" ]]; then
  echo "killing $PID"
  kill -9 $PID
fi


## Reboot:

/sbin/shutdown -r now