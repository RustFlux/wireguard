
WireGuard+UDPspeeder+Udp2raw-tunnel


https://lala.im/5273.html


sudo chmod 600 /etc/wireguard/wg0.conf
sudo wg-quick up wg0
sudo systemctl enable wg-quick@wg0
sudo wg show
sudo wg-quick down wg0


[Interface]
PrivateKey = <你的客户端私钥>
Address = <分配给客户端的 IP 地址>/32
DNS = 1.1.1.1, 1.0.0.1

[Peer]
PublicKey = <服务器的公钥>
AllowedIPs = 0.0.0.0/0
Endpoint = <服务器的公网 IP 地址>:<服务器的端口>


sudo apt update
sudo apt install wireguard



sudo apt install wireguard-dkms wireguard-tools


sudo wg-quick down wg0
wg-quick up wg0
systemctl enable wg-quick@wg0


sudo apt update
sudo apt install resolvconf


sudo systemctl start resolvconf.service
sudo systemctl enable resolvconf.service


PostUp = echo 'nameserver 1.1.1.1' > /etc/resolv.conf
PostDown = echo 'nameserver 8.8.8.8' > /etc/resolv.conf


sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved





cat > wg0.conf << "EEOOFF"
[Interface]
Address = 172.16.11.8/24
DNS = 8.8.8.8, 8.8.4.4
PrivateKey = aHrypJldEulCQEbA8Dw34mk3HrV2VkNWmjiASeJ3gEo=

[Peer]
PublicKey = YNsv7QVImIOuB5/t196jEJ5NYrV3R/IVPAt5bhmnWSg=
PresharedKey = XZ+1Avgx1BvpObHCdhGGeBsmo7ByDXpNwS8mppfA364=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 23.106.140.33:54202
PersistentKeepalive = 25
EEOOFF
