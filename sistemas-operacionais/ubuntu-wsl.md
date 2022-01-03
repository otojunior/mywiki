# Configuração Ubuntu WSL

## Instalação dos Pacotes Básicos:

```bash
sudo apt update
sudo apt upgrade -y
```
```
sudo apt install build-essential default-jdk-headless maven python3 python-is-python3 python3-pip git htop curl wget -y
```

## Instalação do NVM (Node Versions Manager):

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```
```
nvm install --lts=Dubnium
nvm install --lts=Erbium
nvm install --lts=Fermium
nvm install --lts
```

## Instalação do Docker:

### Instalação:

```
curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh
```

### Configuração:

```
sudo groupadd docker
sudo usermod -aG docker $USER
echo "sudo service docker start" | tee -a ~/.bashrc
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a "/etc/sudoers.d/$USER"
alias dockerps="docker ps -a"
```

## Script "Faz-Tudo" Com Todos os Comandos Acima:

- [install-all.sh](install-all.sh)

`curl -o- https://raw.githubusercontent.com/otojunior/mywiki/gh-pages/sistemas-operacionais/install-all.sh | bash`
