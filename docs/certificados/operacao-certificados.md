# Operação com certificados:

## Obter certificado de um determinado sSite:

Aconselha-se executar no Linux ou WSL2 com distro Ubuntu:

`openssl x509 -in <(openssl s_client -connect <host>:<porta> -prexit 2>/dev/null) -out <path certificado>`

Exemplo:

`openssl x509 -in <(openssl s_client -connect hub.estaleiro.serpro:443 -prexit 2>/dev/null) -out /tmp/estaleiro.crt`

## Importação do certificado no Java CACERTS via Keytool:

### Importação de certificados no __cacerts__:

> Nota: Este comando importa um certificado ou cadeia de certificados para o cacerts do Java corrente instalado no PATH da máquina
> Geralmente a senha do keystore padrão do Java é 'changeit' (sem as aspas)'


1. Cadeia de certificados:

`keytool -v -importcert -noprompt -trustcacerts -cacerts -storepass <senha> -file <path certificado> -alias <alias>`

2. Certificado único (gerado por CA ou auto-assinado):

`keytool -v -importcert -noprompt -cacerts -storepass <senha> -file <path certificado> -alias <alias>`

### Importacao de certificado em outro keystore:

`keytool -v -importcert -noprompt -keystore <path keystore> -storepass <senha> -file <path certificado> -alias <alias>`

