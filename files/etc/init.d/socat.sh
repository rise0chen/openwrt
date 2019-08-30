#!/bin/sh /etc/rc.common
USE_PROCD=1
PROCD_DEBUG=1
SERVICE=socat

start_service() {
	procd_open_instance
	procd_set_param command socat open:/dev/ttyS1,raw,b9600 tcp4-connect:47.111.119.186:16464
	procd_set_param respawn 3600 120 30
	procd_set_param stdout 1
	procd_set_param stderr 1
	procd_close_instance
}
