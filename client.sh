# hostname fqdn
# edit /etc/hostname

sudo apt-get update && \

sudo apt-get upgrade -y && \

sudo apt-get install freeipa-client -y && \

sudo ipa-client-install --mkhomedir && \

sudo systemctl enable oddjob && \
sudo systemctl start oddjob && \

# edit /etc/hosts 127.0.1.1 hostname.freeipa-domain-name hostname

sudo bash -c "cat > /usr/share/pam-configs/mkhomedir" <<EOF
Name: activate mkhomedir
Default: yes
Priority: 900
Session-Type: Additional
Session:
        required                        pam_mkhomedir.so umask=0022 skel=/etc/skel
EOF

sudo pam-auth-update
