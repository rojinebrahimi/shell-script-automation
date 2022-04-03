## Set default iptables' filter rules #####################
set -xe
echo "-------------------- Install iptables-persistent --------------------"
apt install -y iptables-persistent

echo "------------------- Appending the iptables 'INPUT Chain' rules --------------------"
iptables -A INPUT -s 192.168.51.0/24 -j ACCEPT
iptables -A INPUT -s 192.168.50.0/24 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 100 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT

echo "-------------------- Appending the RELATED, ESTABLISHED rule --------------------"
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

echo "-------------------- Dropping the rest --------------------"
iptables -A INPUT -j DROP

echo "-------------------- Saving the applied chanages --------------------"
iptables-save > /etc/iptables/rules.v4
