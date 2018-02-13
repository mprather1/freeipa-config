# hostname example.com
# edit /etc hosts

yum update -y && \
yum install firewalld bind-utils rng-tools -y && \

systemctl start firewalld && \

firewall-cmd --permanent --add-port={80/tcp,443/tcp,389/tcp,636/tcp,88/tcp,464/tcp,53/tcp,88/udp,464/udp,53/udp,123/udp} && \
firewall-cmd --reload && \

# nano /etc/hosts ip6 ip4
# ip example.com example.com
# nano /etc/cloud/templates/hosts.redhat.tmpl with ips

systemctl start rngd && \
systemctl enable rngd && \
yum install ipa-server -y

# kinit admin
# ipa user-find admin
