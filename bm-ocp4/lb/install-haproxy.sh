#!/bin/bash

dnf install -y haproxy socat

# we need to turn on this SELinux boolean to use non-standard ports on HAProxy
semanage boolean --modify --on haproxy_connect_any

# kcli removes ending LFs and haproxy dislikes it
echo '' >> /etc/haproxy/haproxy.cfg

systemctl enable --now haproxy
