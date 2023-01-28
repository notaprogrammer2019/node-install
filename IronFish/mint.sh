#!/bin/bash

IP="$(wget -qO- eth0.me)";

Hostna="$(hostname)";

docker exec -i node ironfish wallet:mint --metadata="***" --name=*** --amount=10 --fee=0.00000001 --confirm && curl -s -X POST https://api.telegram.org/bot**token**/sendMessage -d chat_id=*** -d text="IF Node "$Hostna" Minted!. $(date). IP - "$IP""
