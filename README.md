# Baixar a versão desejada e extrair em web/

> cp ./web/include/ost-sampleconfig.php ./web/include/ost-config.php
> chmod 0666 ./web/include/ost-config.php
> mkdir attachments
> chmod +x attachments/

# Não esquecer de renomear o database host para o contexto docker

# Depois de configurado, apagar setup

> rm -rf ./web/setup
> chmod 0644 ./web/include/ost-config.php
