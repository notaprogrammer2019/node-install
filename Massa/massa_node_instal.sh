#!/bin/bash

apt install pkg-config build-essential libssl-dev libclang-dev -y

vers=`wget -qO- https://api.github.com/repos/massalabs/massa/releases/latest | jq -r ".tag_name"`

wget https://github.com/massalabs/massa/releases/download/${vers}/massa_${vers}_release_linux.tar.gz && tar -xvf massa_${vers}_release_linux.tar.gz && chmod +x ~/massa/massa-node ~/massa/massa-client && printf "[Unit]
Description=Massa Node
After=network-online.target

[Service]
User=root
WorkingDirectory=$HOME/massa/massa-node
ExecStart=$HOME/massa/massa-node/massa-node -p
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/massanode.service && sudo tee <<EOF >/dev/null $HOME/massa/massa-node/config/config.toml 
[network]
routable_ip = "`wget -qO- eth0.me`"
EOF

ufw allow 31244 && ufw allow 31245
