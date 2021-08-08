sudo kill -9 $(cat /var/run/dhcpd.pid) 2>/dev/null ; sudo dhcpd -cf dhcpd.conf -pf /var/run/dhcpd.pid at0

