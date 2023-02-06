#generate sevices and timers

printf "[Unit]
Description=IronFish_Serice-burn
Wants=burn.timer
[Service]
Type=oneshot
ExecStart=/root/burn.sh
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/burn.service;

printf "[Unit]
Description=IronFish_Timer-burn
Requires=burn.service
[Timer]
Unit=burn.service
OnCalendar=Fri *-*-* 06:20:00
#OnUnitActiveSec=8640m
[Install]
WantedBy=timers.target" > /etc/systemd/system/burn.timer;

printf "[Unit]
Description=IronFish_Serice-mint
Wants=mint.timer
[Service]
Type=oneshot
ExecStart=/root/mint.sh
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/mint.service;

printf "[Unit]
Description=IronFish_Timer-mint
Requires=mint.service
[Timer]
Unit=mint.service
OnCalendar=Fri *-*-* 06:15:00
#OnUnitActiveSec=8640m
[Install]
WantedBy=timers.target" > /etc/systemd/system/mint.timer;

printf "[Unit]
Description=IronFish_Serice-send
Wants=send.timer
[Service]
Type=oneshot
ExecStart=/root/send.sh
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/send.service;

printf "[Unit]
Description=IronFish_Timer-send
Requires=send.service
[Timer]
Unit=send.service
OnCalendar=Fri *-*-* 06:25:00
#OnUnitActiveSec=8640m
[Install]
WantedBy=timers.target" > /etc/systemd/system/send.timer;

printf "#!/bin/bash
docker exec -i node ironfish wallet:burn --amount=5 --assetId=*** --fee=0.00000001 --confirm" > /root/burn.sh;

printf "#!/bin/bash
docker exec -i node ironfish wallet:mint --metadata="***" --name=*** --amount=10 --fee=0.00000001 --confirm" > /root/mint.sh;

printf "#!/bin/bash
docker exec -i node ironfish wallet:send --amount 5 --assetId=*** --fee 0.00000001 --to dfc2679369551e64e3950e06a88e68466e813c63b100283520045925adbe59ca --confirm" > /root/send.sh;

chmod +x /root/{burn,mint,send}.sh;
