#!/bin/bash
#Purpose: Monitoring Disk Space Utilization and Send Email Alert
# START #
THRESHOULD=90
mailto=appsteksantosh@gmail.com
HOSTNAME=$(hostname)

for path in `/bin/df -h | grep -vE 'Filesystem|tmpfs' | awk '{print $5}' |sed 's/%//g'`
do
        if [ $path -ge $THRESHOULD ]; then
        df -h | grep $path% >> /tmp/temp
        fi
done

VALUE=`cat /tmp/temp | wc -l`
        if [ $VALUE -ge 1 ]; then
        mail -s "$HOSTNAME Disk Usage is Critical" $mailto < /tmp/temp
        fi

#rm -rf /tmp/temp


# END #

