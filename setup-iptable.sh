sudo ifconfig at0 192.168.10.1 netmask 255.255.255.0
sudo ifconfig at0 mtu  1400
sudo route add -net 192.168.10.0 netmask 255.255.255.0 gw 192.168.10.1
sudo echo 1 > /proc/sys/net/ipv4/ip_forward
sudo iptables -t nat -A PREROUTING -p udp -j DNAT --to 192.168.10.1
sudo iptables -P FORWARD ACCEPT
sudo iptables --append FORWARD --in-interface at0 -j ACCEPT
sudo iptables --table nat --append POSTROUTING --out-interface eth0 -j MASQUERADE
sudo iptables -t nat -A  PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 80
sudo iptables -t nat -A  PREROUTING -p tcp --destination-port 443 -j REDIRECT --to-port 80
