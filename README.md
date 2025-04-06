#Pré-requisitos

## AWS Profile

No arquivo `~./aws/credentials` defina as credenciais em profile customizado:
```
[fiap]
aws_access_key_id=
aws_secret_access_key=
aws_session_token=
```
Adicionei uma entrada no arquivo `~/.aws/config` para especificar a região padrão.
```
[profile fiap]
region = us-east-1
```

## Terraform

Para inicialização do terraform crie um arquivo terraform.tfvars com os seguintes dados:
```
aws_profile = "fiap"
aws_region = "us-east-1"
```

Execute o comando de inicialização da seguinte forma:
`terraform init -backend-config "profile=fiap"`
