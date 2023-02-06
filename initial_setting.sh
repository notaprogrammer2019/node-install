apt update && apt upgrade -y && apt install wget jq curl ufw git htop glances -y && wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz && export PATH=$PATH:/usr/local/go/bin && go version && git clone https://github.com/notaprogrammer2019/duf.git /root/duf && cd duf && go build && mv /root/duf/duf /usr/local/bin && rm -rf /root/duf && cd && rm go1.19.3.linux-amd64.tar.gz && ufw allow 34343 && echo y | ufw enable;

tee <<EOF >/dev/null > /etc/ssh/sshd_config 
#Include /etc/ssh/sshd_config.d/*.conf

Port 34343
AddressFamily inet
#ListenAddress 0.0.0.0
#ListenAddress ::

#HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_ecdsa_key
#HostKey /etc/ssh/ssh_host_ed25519_key

# Ciphers and keying
#RekeyLimit default none

# Logging
#SyslogFacility AUTH
LogLevel INFO

# Authentication:

LoginGraceTime 1m
PermitRootLogin yes
#StrictModes yes
MaxAuthTries 1
MaxSessions 3

PubkeyAuthentication yes

# Expect .ssh/authorized_keys2 to be disregarded by default in future.
AuthorizedKeysFile .ssh/authorized_keys

#AuthorizedPrincipalsFile none

#AuthorizedKeysCommand none
#AuthorizedKeysCommandUser nobody

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
#HostbasedAuthentication no
# Change to yes if you don't trust ~/.ssh/known_hosts for
# HostbasedAuthentication
#IgnoreUserKnownHosts no
# Don't read the user's ~/.rhosts and ~/.shosts files
#IgnoreRhosts yes

# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication no
PermitEmptyPasswords no

# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
ChallengeResponseAuthentication no

# Kerberos options
KerberosAuthentication no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes
#KerberosGetAFSToken no

# GSSAPI options
GSSAPIAuthentication no
#GSSAPICleanupCredentials yes
#GSSAPIStrictAcceptorCheck yes
#GSSAPIKeyExchange no

UsePAM yes

AllowAgentForwarding no
AllowTcpForwarding no
#GatewayPorts no
X11Forwarding no
#X11DisplayOffset 10
#X11UseLocalhost yes
#PermitTTY yes
PrintMotd no
#PrintLastLog yes
#TCPKeepAlive yes
#PermitUserEnvironment no
#Compression delayed
#ClientAliveInterval 0
#ClientAliveCountMax 3
#UseDNS no
#PidFile /var/run/sshd.pid
#MaxStartups 10:30:100
#PermitTunnel no
#ChrootDirectory none
#VersionAddendum none

# no default banner path
#Banner none

# Allow client to pass locale environment variables
AcceptEnv LANG LC_*

# override default of no subsystems
Subsystem sftp /usr/lib/openssh/sftp-server

# Example of overriding settings on a per-user basis
#Match User anoncvs
#X11Forwarding no
#AllowTcpForwarding no
#PermitTTY no
#ForceCommand cvs server
EOF

printf "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAlg0vTo8/TPaHPZ7dl/R5IZDWFFL7ol4imyDTybEu7RT6aFRc26ijnS7+olJzqaN59mJ/d5bSm4w3qkgysFeaDCXN4NSJyhDq32JyVh0Jz6FDzvIR0WT642iYECwQSYTOXQgXbYX1tIfqcMH9hFzGtMfmXKLq71oMhwdZxA0kAzegHKOcpyiQn7/ROLDs5UOLSY2yzpXbxOc0Mv3T3u+/V4Ccs9eQ5dxRFgOAhR7WPnzkIl49Lt2cHPuu8WlHUHg3b3H+0A4Eb4yRW3ndivDW5aWCPN+yR5lsugTJX2Udh1NhS0C9QdHWxt/R34YcUJBF+edsvGAIQVyUwEd4VcXyDS/22Zi4GkRGaUHnbRmIWjvlUk4jI9JaxAlqI4iOhqu42qHRG/fcmu7Se0f/41j8ubEJyHMHqJbz99qdYTJX1OriAWVyXYoUqP3GqxFWplOveg2kDAcUz8ufBPra9iaivOqkbLY8yU2n99hWk0L5aaOyexXclj9+9Q9FkkT73MmU9XGdbAYayb5vSq4w4k17GXhkyADbT1Z0bUSplFSiM3J47DAip0mbjcjpnOu2o6DQUpqGclBwfv9RBK+PY6aBtMKdnMkZ0ac9xZ2DHwRq5rGLxpGDMZrBPungbR61IDSpuW1h+HYlq0COsgKqQV1Dz59Sh5KNjqRp5xKASPRuft8= My" > .ssh/authorized_keys && systemctl restart sshd
