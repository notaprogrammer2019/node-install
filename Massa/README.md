# massa-repo

Official github https://github.com/massalabs and official install node https://massa.readthedocs.io/en/latest/index.html

Official releases https://github.com/massalabs/massa/releases

# Massa node install

   1. "no brain" install:
   
    . <(wget -qO- https://raw.githubusercontent.com/notaprogrammer2019/node-install/main/Massa/massa_node_instal.sh)
        
   2. Logs: 
   
    systemctl daemon-reload && systemctl enable massanode && systemctl restart massanode

   3.
   
    journalctl -u massanode -f
