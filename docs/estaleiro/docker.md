# Configuração de Docker Local para Pull de Imagens Estaleiro

1. Adicionar `{"insecure-registries":["hub.estaleiro.serpro:443"]}` em **/etc/docker/daemon.json**
2. Criar a pasta **/etc/docker/certs.d/hub.estaleiro.serpro**
3. Baixar o certificado do site https://hub.estaleiro.serpro:
    - `openssl x509 -in <(openssl s_client -connect hub.estaleiro.serpro:443 -prexit 2>/dev/null) -out /tmp/hub_estaleiro.crt`
4. Jogar o certificado baixado na pasta criada no passo 1.
5. Reiniciar o serviço do docker

---

Script:

```
#!/bin/bash
sudo echo -E "{\"insecure-registries\":[\"hub.estaleiro.serpro:443\"]}" | sudo tee -a /etc/docker/daemon.json
sudo mkdir -p /etc/docker/certs.d/hub.estaleiro.serpro
openssl x509 -in <(openssl s_client -connect hub.estaleiro.serpro:443 -prexit 2>/dev/null) -out /tmp/hub.estaleiro.serpro.crt
sudo cp -v /tmp/hub.estaleiro.serpro.crt /etc/docker/certs.d/hub.estaleiro.serpro/hub.estaleiro.serpro.crt
#systemctl restart docker
sudo service docker restart
```