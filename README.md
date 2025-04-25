#Pré-requisitos

## AWS Profile

No arquivo `~./aws/credentials` defina as credenciais em profile customizado:
```
[default]
aws_access_key_id=
aws_secret_access_key=
aws_session_token=
```
Adicionei uma entrada no arquivo `~/.aws/config` para especificar a região padrão.
```
[profile default]
region = us-east-1
```

# Comandos de referência
Para autenticação no ECR a partir da linha de comando:
`aws ecr get-login-password --region region | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region.amazonaws.com`

Para conceder permissão ao arquivo setup.sh
`chmod +x setup.sh`