# DevSecOps-Linux
Atividade de Linux da trilha DevSecOps

# Parte prática: Requisitos AWS

## Requisitos AWS

- [ ] Gerar uma chave pública para acesso ao ambiente.
- [ ] Criar 1 instância EC2 com o sistema operacional Amazon Linux 2 (Família t3.small, 16 GB SSD).
- [ ] Gerar 1 Elastic IP e anexar à instância EC2.
- [ ] Liberar as portas de comunicação para acesso público: (22/TCP, 111/TCP e UDP, 2049/TCP/UDP, 80/TCP, 443/TCP).

## Requisitos no Linux

- [ ] Configurar o NFS entregue.
- [ ] Criar um diretório dentro do filesystem do NFS com seu nome.
- [ ] Subir um Apache no servidor - o Apache deve estar online e rodando.
- [ ] Criar um script que valide se o serviço está online e envie o resultado da validação para o seu diretório no NFS.
- [ ] O script deve conter: Data HORA + nome do serviço + Status + mensagem personalizada de ONLINE ou offline.
- [ ] O script deve gerar 2 arquivos de saída: 1 para o serviço online e 1 para o serviço OFFLINE.
- [ ] Preparar a execução automatizada do script a cada 5 minutos.
- [ ] Fazer o versionamento da atividade.
- [ ] Fazer a documentação explicando o processo de instalação do Linux.
