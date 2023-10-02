# DevSecOps-Linux
Atividade de Linux da trilha DevSecOps

# Parte prática: Requisitos AWS

## Requisitos AWS

- [X] Gerar uma chave pública para acesso ao ambiente.
      
      1. Acesse o console da AWS e entre na sua conta.
      2. No painel de controle, clique em "Services" e selecione "EC2" na seção "Compute".
      3. No painel de navegação no lado esquerda, clique em "Key Pairs" em "Network & Security".
      4. Clique no botão "Create Key Pair", para criar uma chave pública.
      5. Escolha um nome para a chave e selecione o formato do arquivo de chave, o formato geralmente escolhido é o .pem.
      6. Clique em "Create Key Pair" para que a chave seja gerada. O arquivo da chave privada será baixado automaticamente no seu computador, é importante não perdê-la já          que para acessar a instância a chave é necessária.

- [X] Criar 1 instância EC2 com o sistema operacional Amazon Linux 2 (Família t3.small, 16 GB SSD).
      
      1. No painel de controle do EC2, clique em "Executar Instância" para criar uma nova instância.
      2. Na primera etapa, adicione o nome da sua instâncias e caso queira adicione tags.
      3. Selecione Amazon Linux 2 como imagem da máquina. Após isso, adicione a família da instância, que no caso é a t3.small.
      4. Na seção do Par de chaves, adicione a chave criada na etapa anterior.
      5. Na etapa de configuração de rede, o usuário adiciona a VPC que deseja utilizar e o grupo de segurança que fará uso, podendo modificar depois.
      6. Na próxima etapa é configurado o armazenamento, que para a intância pedida é 16GB SSD.
      7. E para finalizar, clica em "Executar Instância".
      
- [X] Gerar 1 Elastic IP e anexar à instância EC2.
      
      1. No painel de navegação no lado esquerda, clique em "Elastic IP" em "Network & Security".
      2. Clique em "Allocate elastic IP address", crie o IP e aloque-o à sua intância.
      
- [X] Liberar as portas de comunicação para acesso público: (22/TCP, 111/TCP e UDP, 2049/TCP/UDP, 80/TCP, 443/TCP).
      
      1. No painel de navegação no lado esquerda, clique em "Security Groups" em "Network & Security".
      2. Selecione o grupo de segurança que está associado a sua instância.
      3. Na guia "Inbound Rules", clique em "Edit inbound rules".
      4. Crie regras de entrada para as portas necessárias (22/TCP, 111/TCP e UDP, 2049/TCP/UDP, 80/TCP, 443/TCP) permitindo tráfego de qualquer lugar (0.0.0.0/0).
      5. Clique em "Save rules" para aplicar as alterações.

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
