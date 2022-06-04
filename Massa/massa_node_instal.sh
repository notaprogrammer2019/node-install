#!/bin/bash

apt install wget jq pkg-config curl git build-essential libssl-dev -y && wget https://github.com/massalabs/massa/releases/download/TEST.10.1/massa_TEST.10.1_release_linux.tar.gz && tar -xvf massa_TEST.10.1_release_linux.tar.gz && chmod +x ~/massa/massa-node ~/massa/massa-client && printf "[Unit]
Description=Massa Node
After=network-online.target

[Service]
User=$USER
WorkingDirectory=$HOME/massa/massa-node
ExecStart=$HOME/massa/massa-node/massa-node
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/massanode.service && systemctl daemon-reload && systemctl enable massanode && systemctl restart massanode
