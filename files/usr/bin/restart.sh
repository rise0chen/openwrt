#!/bin/sh
cmd=$1

while true
do
	sleep 10
	ps | grep $cmd | grep -v "grep" | grep -v "restart"
	if [ "$?" -eq 1 ]
	then
		$cmd
		echo "process has been restarted!"
	else
		echo "process already started!"
	fi
done
