#wireguard


iptables -t nat -A PREROUTING -p tcp --dport 10000:65535 -j REDIRECT --to-port 51820

iptables -t nat -A PREROUTING -p udp --dport 10000:65535 -j REDIRECT --to-port 51820


service iptables save

iptables -t nat -A PREROUTING -p udp --dport 10000:60000 -j REDIRECT --to-port 50572

iptables-save > /etc/iptables/rules.v4

mkdir  /etc/iptables/

iptables-save > /etc/iptables/rules.v4


