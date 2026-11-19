#!/bin/sh

apk add $PLUS_PACKAGES

# settings
user=$XRDP_USER
passwd=$XRDP_PASSWORD
runtime_exec=$XRDP_SESSION

# heh
adduser --disabled-password --gecos "" $user
echo "$user:$passwd" | chpasswd

xsession=/home/$user/.xinitrc
echo "exec $runtime_exec" > $xsession
chmod +x $xsession
chown $user:$user $xsession

for group_name in $XRDP_USER_GROUPS; do
    addgroup $user $group_name
done

echo 'export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"' >> /etc/profile
echo "$user ALL=(ALL:ALL) ALL" >> /etc/sudoers

xrdp-sesman &
xrdp -n -p 2000
