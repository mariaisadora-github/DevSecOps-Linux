#!/bin/bash

DATA_HORA=$(date "+%Y-%m-%d %H:%M:%S")
NOME_SERVICO="Apache"
STATUS=$(systemctl is-active httpd)

if [ "$STATUS" = "active" ]; then
    MENSAGEM="ONLINE"
else
    MENSAGEM="OFFLINE"
fi

echo "$DATA_HORA $NOME_SERVICO Status: $MENSAGEM" > /srv/share/isadora/resultado_${MENSAGEM}.txt
