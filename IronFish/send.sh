#!/bin/bash

IP="$(wget -qO- eth0.me)";

Hostna="$(hostname)";

docker exec -i node ironfish wallet:send --amount 5 --assetId=*** --fee 0.00000001 --to dfc2679369551e64e3950e06a88e68466e813c63b100283520045925adbe59ca --confirm && curl -s -X POST https://api.telegram.org/bot**token**/sendMessage -d chat_id=*** -d text="IF Node "$Hostna" Sended!. $(date). IP - "$IP""
