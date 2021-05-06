# Remove all nameserver settings and use localhost with unbound
(
sed '/nameserver/d' /etc/resolv.conf 2>/dev/null
echo 'nameserver 127.0.0.1' > /etc/resolv.conf
)
