#!/bin/bash

DATA_HORA=$(date "+%Y-%m-%d %H:%M:%S") #cria a variável data, informando o formato e chamando a função date que aplica a data e hora atual
NOME_SERVICO="Apache" #cria a variável com o nome do serviço
STATUS=$(systemctl is-active httpd) #executa o comando para ver se o httpd está ativo ou não e o resultado é armazenado na variável

if [ "$STATUS" = "active" ]; then #Inicia uma condicional, verifica se a variável status tem como valor "active"
    MENSAGEM="ONLINE" #Se o serviço estiver ativo, a variável MENSAGEM é definida como "ONLINE".
else #se o serviço não estiver online, ele prossegue para esse passo
    MENSAGEM="OFFLINE" #Se o serviço estiver inativo, a variável MENSAGEM é definida como "OFFLINE".
fi

echo "$DATA_HORA $NOME_SERVICO Status: $MENSAGEM" >> /srv/share/isadora/resultado_${MENSAGEM}.txt #mprime uma mensagem que inclui a data e hora, o nome do serviço e seu status (online ou offline). A mensagem é redirecionada para um arquivo de texto localizado em "/srv/share/isadora/resultado_${MENSAGEM}.txt". O nome do arquivo será "resultado_ONLINE.txt" se o serviço estiver online e "resultado_OFFLINE.txt" se o serviço estiver offline.
