# massa-repo

Official github https://github.com/massalabs and official install node https://github.com/massalabs/massa/wiki/install

Official releases https://github.com/massalabs/massa/releases

# Massa node install

   1. "no brain" install:
   
    . <(wget -qO- https://raw.githubusercontent.com/notaprogrammer2019/node-install/main/Massa/massa_node_instal.sh)
        
   2. Logs: 
   
    journalctl -u massanode -f

   3.
   
    systemctl daemon-reload && systemctl enable massanode && systemctl restart massanode
