#!/bin/bash

IP="$(wget -qO- eth0.me)"

Hostna="$(hostname)";

docker exec -i node ironfish wallet:burn --amount=5 --assetId=*** --fee=0.00000001 --confirm && curl -s -X POST https://api.telegram.org/bot**token**/sendMessage -d chat_id=*** -d text="IF Node "$Hostna" Burned!. $(date). IP - "$IP""
