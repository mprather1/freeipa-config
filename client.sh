sudo apt-get update && \

sudo apt-get upgrade -y && \

sudo apt-get install free-ipa-client -y && \

ipa-client-install --mkhomedir && \

systemctl enable oddjob; systemctl start oddjob && \

sudo bash -c "cat > /usr/share/pam-configs/mkhomedir" <<EOF
Name: activate mkhomedir
Default: yes
Priority: 900
Session-Type: Additional
Session:
        required                        pam_mkhomedir.so umask=0022 skel=/etc/skel
EOF

sudo pam-auth-update
