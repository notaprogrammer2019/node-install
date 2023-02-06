# IronFish auto mint/burn/send
   0. Start node
   
    . <(wget -qO- https://raw.githubusercontent.com/notaprogrammer2019/node-install/main/ironfish/if_start-node.sh)
   
   1. Generate services and timers:
   
    . <(wget -qO- https://raw.githubusercontent.com/notaprogrammer2019/node-install/main/ironfish/generate_sevices-timers.sh)
        
   2. Adding to the autoload: 
   
    systemctl daemon-reload && systemctl enable {send,burn,mint}.timer

   3.
   
    systemctl restart mint.timer && journalctl -u mint.timer
    
   4. 
 
    systemctl restart burn.timer && journalctl -u burn.timer
    
   5.
 
    systemctl restart send.timer && journalctl -u send.timer
