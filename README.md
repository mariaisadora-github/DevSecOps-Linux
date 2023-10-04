# DevSecOps-Linux
Atividade de Linux da trilha DevSecOps

# Parte prática: Requisitos AWS

## Requisitos AWS

#### Gerar uma chave pública para acesso ao ambiente.
      
 1. Acesse o console da AWS e entre na sua conta.
 2. No painel de controle, clique em "Services" e selecione "EC2" na seção "Compute".
 3. No painel de navegação no lado esquerda, clique em "Key Pairs" em "Network & Security".
 4. Clique no botão "Create Key Pair", para criar uma chave pública.
 5. Escolha um nome para a chave e selecione o formato do arquivo de chave, o formato geralmente escolhido é o .pem.
 6. Clique em "Create Key Pair" para que a chave seja gerada. O arquivo da chave privada será baixado automaticamente no seu computador, é importante não perdê-la já que para acessar a instância a chave é necessária.

#### Criar 1 instância EC2 com o sistema operacional Amazon Linux 2 (Família t3.small, 16 GB SSD).
      
 1. No painel de controle do EC2, clique em "Executar Instância" para criar uma nova instância.
 2. Na primera etapa, adicione o nome da sua instâncias e caso queira adicione tags.
 3. Selecione Amazon Linux 2 como imagem da máquina. Após isso, adicione a família da instância, que no caso é a t3.small.
 4. Na seção do Par de chaves, adicione a chave criada na etapa anterior.
 5. Na etapa de configuração de rede, o usuário adiciona a VPC que deseja utilizar e o grupo de segurança que fará uso, podendo modificar depois.
 6. Na próxima etapa é configurado o armazenamento, que para a intância pedida é 16GB SSD.
 7. E para finalizar, clica em "Executar Instância".
      
#### Gerar 1 Elastic IP e anexar à instância EC2.
      
 1. No painel de navegação no lado esquerda, clique em "Elastic IP" em "Network & Security".
 2. Clique em "Allocate elastic IP address", crie o IP e aloque-o à sua intância.
      
#### Liberar as portas de comunicação para acesso público: (22/TCP, 111/TCP e UDP, 2049/TCP/UDP, 80/TCP, 443/TCP).
      
 1. No painel de navegação no lado esquerda, clique em "Security Groups" em "Network & Security".
 2. Selecione o grupo de segurança que está associado a sua instância.
 3. Na guia "Inbound Rules", clique em "Edit inbound rules".
 4. Crie regras de entrada para as portas necessárias (22/TCP, 111/TCP e UDP, 2049/TCP/UDP, 80/TCP, 443/TCP) permitindo tráfego de qualquer lugar (0.0.0.0/0).
 5. Clique em "Save rules" para aplicar as alterações.

## Requisitos no Linux
Para entrar na instância foi usado o terminal do ubuntu com o seguinte comando: ssh -i chave-atividade.pem ec2-user@[IP_PUBLICO]

#### Configurar o NFS entregue.
      
 1. sudo yum install nfs-utils - comando utilizado para entrar instalar o nfs na instância, na minha intância já veio instalado.
 2. sudo systemctl status nfs-server - comando para verificar o status do nfs.
 3. sudo systemctl start nfs-server - comando para iniciar o nfs.
 4. sudo systemctl enable nfs-server - comando para habilitar o serviço nfs e configurá-lo para ser iniciado automaticamente durante o processo de inicialização do sistema.
 5. sudo mkdir /srv/share - comando para criar o diretório chamado "share" no sistema de arquivos do Linux, especificamente no diretório "/srv".
 6. sudo chown nfsnobody:nfsnobody /srv/share - comando que configura o diretório "/srv/share" para que o usuário e grupo "nfsnobody" sejam os proprietários.
 7. sudo nano /etc/exports - comando para entrar e editar o arquivo exports.
 8. /srv/share [IP_SUBNET]'(rw,all_squash)' - comando que vai definir as configurações de compartilhamento para o diretório /srv/share.
 9. sudo exports -rva - comando que atualiza as configurações de compartilhamento nfs no servidor e aplicando qualquer alteração feita no arquivo /etc/exports sem a necessidade de reiniciar o serviço NFS.

![Imagem referente a pasta /srv/share](/imagens/pastassrvshare.png)
      
#### Criar um diretório dentro do filesystem do NFS com seu nome.

 1. cd /srv/share - comando para entrar no diretório.
 2. sudo mkdir isadora - comando para criar o diretório isadora no diretório que entramos anteriormente
 3. sudo chmod 777 isadora - comando para atribuir permissões de leitura, gravação e execução ao diretório.

![Imagem referente a criação do diretório com meu nome e parte do que ocorre quando o script é executado](/imagens/pastaisadora.png)

#### Subir um Apache no servidor - o Apache deve estar online e rodando.

 1. sudo yum update - comando para atualizar os pacotes do sistema operacional.
 2. sudo yum install http - comando para instalar o apache.
 3. sudo systemctl start httpd - comando para iniciar o apache.
 4. sudo systemctl enable httpd - comando para habilitar que o apache seja iniciado automaticamente quando a instância for inicializada.
 5. sudo systemctl status httpd - comando para verificar o status do apache.

![Imagem referente ao status do apache](/imagens/apache.png)

#### Criar um script que valide se o serviço está online e envie o resultado da validação para o seu diretório no NFS, o script deve conter: Data HORA + nome do serviço + Status + mensagem personalizada de ONLINE ou offline. O script deve gerar 2 arquivos de saída: 1 para o serviço online e 1 para o serviço OFFLINE.

[Clique aqui](/script.sh) para ver o script.

![Imagem referente ao script](/imagens/online.png)

![Imagem referente ao script](/imagens/offline.png)

#### Preparar a execução automatizada do script a cada 5 minutos.

 1. crontab -e - comando para editar as tarefas cron, que são agendamentos de tarefas que executam comandos ou scripts em momentos específicos ou em intervalos regulares.
 2. No arquivo adiciona a segunte linha: */5 * * * * /srv/share/validacao_apache.sh, após salvar, o script vai rodar a cada 5 minutos.
  
![Imagem referente ao crontab](/imagens/crontab.png)

## Teste

- Para testar foi realizado os seguintes passos:


 1. Foi criado uma máquina virtual no serviço EC2, utilizei a mesma chave e o mesmo grupo de segurança, só verifiquei se a máquina cliente e a servidor estavam na mesma sub-rede.
 2. Foi dado o comando "sudo systemctl status nfs-server" para verificar se o nfs estava ativo ou não.
 3. Como estava inativo, foi dado o comando "sudo systemctl start nfs-server" e "sudo systemctl enable nfs-server", para ativar o nfs e para sempre que a instância for inicializada o nfs seja iniciado, respectivamente.
 4. Para realizar o compartilhamento de arquivos entre as máquinas foi dado o comando "sudo mount -t nfs [IP_PRIVADO_SERVER]:/srv/share/isadora /mnt", o comando mount permite montar dispositivos ou sistemas de arquivos no Linux.
  
![Imagem referente ao teste](/imagens/client.png)
