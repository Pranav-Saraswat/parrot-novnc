#!/bin/bash
x1=$(hostname -I | cut -d' ' -f1)
x2=hero
x3=hero
x4=hero11
echo -e "\nroot pass -> $x2\n-----------------------\nUsername  -> xuser\nPassword  -> $x3\nVNC pass  -> $x4\n\nhttp://$x1:6080/index.html\n"
echo root:$x2 | chpasswd
echo xuser:$x3 | chpasswd
mkdir -p /home/xuser/.vnc
echo $x4 | vncpasswd -f > /home/xuser/.vnc/passwd
chmod 600 /home/xuser/.vnc/passwd
chown -R xuser:xuser /home/xuser/
unset x1 x2 x3 x4
supervisord 1>/dev/null 2>/dev/null
