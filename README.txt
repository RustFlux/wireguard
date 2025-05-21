#wireguard

apt update

apt install iptables iptables-persistent

echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf

sudo sysctl -p  # 立即生效


iptables -t nat -A PREROUTING -p tcp --dport 10000:65535 -j REDIRECT --to-port 51820

iptables -t nat -A PREROUTING -p udp --dport 10000:65535 -j REDIRECT --to-port 51820



# 保存规则（持久化）
sudo netfilter-persistent save

sudo netfilter-persistent reload




service iptables save

iptables -t nat -A PREROUTING -p udp --dport 10000:60000 -j REDIRECT --to-port 50572

iptables-save > /etc/iptables/rules.v4

mkdir  /etc/iptables/

iptables-save > /etc/iptables/rules.v4


