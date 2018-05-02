#!/bin/bash
B="<HTML><HEAD><TITLE>Success</TITLE></HEAD><BODY>Success</BODY></HTML>"
BL=${#B}
SLEEPTIME=5
ECHOFLAG=1
USERNAME=
PASSWORD=
while :
do
    A=$(curl -s captive.apple.com)
    if [ $? -eq 0 ]
    then
        AL=${#A}
        if [ $AL -ne $BL ]
        then
            X=$(curl -s -k --data "user=${USERNAME}&password=${PASSWORD}&cmd=authenticate&Login=Log+In" -X POST https://securelogin.net.cuhk.edu.hk/cgi-bin/login)
            now=$(date)
            echo "try login: $now"
            ECHOFLAG=1
            continue
        else
            if [ $ECHOFLAG -eq 1 ]
            then
                echo "Success"
                ECHOFLAG=0
            fi
        fi
        sleep $SLEEPTIME
    else
        sleep 1s
    fi
done
