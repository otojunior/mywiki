## Criação/Atualização de certificado/Keystore para integração com os WebServices externos

1. Criar chaves RSA e Certificate Request  

```bash
$> openssl req -new -newkey rsa:2048 -sha256 -keyout krfb-hom.key -out krfb-hom.csr
```

- Country Name: BR
- State or Province Name: MG
- Locality Name: BELO HORIZONTE
- Organization Name: SERVICO FEDERAL DE PROCESSAMENTO DE DADOS - SERPRO
- Organizational Unit Name: Autoridade Certificadora do SERPRO Final SSL - Hom
- Common Name: homologacao-krfb.estaleiro.serpro.gov.br
- Email Address: cesar.mendonca@serpro.gov.br

Sem atributos extras.
	
2. Abrir site https://certificadoshom.serpro.gov.br/arserprossl  
	2.1. Menu **Meu Certificado -> Solicitar**  
	2.2. Selecionar **Equipamento -> "Equipamento A1 (Institucional)**  
	
3. Preencher Formulário  
	3.1. URL (Este será o CN do certificado): **homologacao-krfb.estaleiro.serpro.gov.br**  
	3.2. Em **Representantes Legais** e **Responsáveis pelo Certificado**, colocar nome e **CPF** do solicitante.  
	3.3. Será gerado um **Número de Referência** e **Código de Acesso** para o pedido que **deve ser guardado**.  
	
4. Pedir ao Antônio Henrique ou Bia para aprovar o pedido.

* Antônio Henrique: antonio-henrique.jesus@serpro.gov.br  
* Bia: fabiana.souza@serpro.gov.br

5. Baixar o certificado  
	5.1. **Meu Certificado -> Baixar**  
	5.2. Anexar o Request (krfb-hom.csr) gerado no passo 1.  
	
6. Baixar do site, o certificado no formato PEM (.cer):  
	6.1. Menu **Meu Certificado -> Consultar**  
	6.2. No fim da página, botão **Baixar X509 PEM**  
	
7. Criar Keystore do Java com a chave gerada (.key) no passo 1 e o certificado gerado no passo 6 (.cer)  
```bash
$> openssl pkcs12 -export -out krfb-hom.p12 -name "homologacao-krfb.estaleiro.serpro.gov.br" -inkey krfb-hom.key -in HOMOLOGACAOKRFBESTALEIROSERPROGOVBR.cer  
$> keytool -importkeystore -srckeystore krfb-hom.p12 -srcstoretype PKCS12 -destkeystore keystore-hom.jks -deststoretype JKS  
```
> OBS: O Java 8 aceita Keystores do tipo PKCS12 e JKS, porém a partir do Java 11 somente PKCS12, então caso o projeto já estiver em Java 11 (no momento da escrita deste tutorial, ainda está no Java 8), não executar a conversão do keystore para formato JKS (2o. comando do passo 7).

---

> OBS 2: Para o funcionamento do Web Service de consulta de CPF da RFB, é necessário passar o **Serial Number** do certificado para a equipe responsável:
> * paulo.assis@serpro.gov.br
> * flavio.silveira@serpro.gov.br
```bash
$> openssl x509 -in HOMOLOGACAOKRFBESTALEIROSERPROGOVBR.cer -text -noout
```

---

Comando úteis do Keytool:

1. Listar certificados dentro da Keystore:
```bash
$> keytool -list -v -keystore keystore-hom.jks
```