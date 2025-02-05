
# Terraform AWS Infrastructure

Este repositório contém configurações do Terraform para provisionar recursos na AWS, incluindo VPC, Load Balancer, EC2, CloudFront, e configurações de rede.

## Passo a Passo para Executar o Código

### 1. Inicializar o Terraform

Antes de rodar os comandos do Terraform, inicialize o ambiente com o comando:

```bash
terraform init
```

Isso irá configurar o backend e baixar os providers necessários.

### 2. Criar a Rede (VPC e Sub-redes)

Execute o Terraform para criar a infraestrutura de rede (VPC, sub-redes, NAT Gateway, etc.):

```bash
terraform apply -var-file="mgmt.tfvars"
```

Esse comando cria a VPC, sub-redes públicas, privadas, e isoladas, além de configurar o NAT Gateway e a internet gateway.

### 3. Criar a Instância EC2

Depois que a rede for criada, aplique o Terraform para criar as instâncias EC2:

```bash
terraform apply -var-file="App-Docker.tfvars"
```

Esse comando irá provisionar a instância EC2 necessária para rodar a aplicação Docker.

### 4. Configuração do Nginx

O Nginx será utilizado como um servidor web para fornecer o conteúdo da aplicação Docker. Após a criação da instância EC2, o Nginx será configurado para servir como proxy reverso para a aplicação. Ele estará rodando em uma porta configurada, mas o acesso será feito através do CloudFront.

### 5. URL de Acesso à Aplicação

Após a execução do Terraform, a URL pública para acessar a aplicação estará disponível através do CloudFront:

[https://d22wv7u8wjb1z1.cloudfront.net/](https://d22wv7u8wjb1z1.cloudfront.net/)

## Detalhes de Configuração

### Variáveis Necessárias

As variáveis para configurar o ambiente estão nos arquivos `App-Docker.tfvars` e `mgmt.tfvars`. Aqui estão algumas das principais variáveis:

- **`profile`**: O perfil da AWS que será utilizado.
- **`region`**: A região onde os recursos serão provisionados.
- **`create_vpc`**: Determina se a VPC será criada.
- **`vpc_cidr_block`**: CIDR da VPC.
- **`keypair_name`**: Nome do par de chaves para as instâncias EC2.
- **`vpc_tags`**: Tags para a VPC.

Você pode personalizar essas variáveis conforme necessário para o seu ambiente.

### Arquivo `mgmt.tfvars` (Configuração de Rede)

| Nome                | Descrição                                         | Tipo   | Padrão      | Obrigatório |
|---------------------|---------------------------------------------------|--------|-------------|-------------|
| `profile`           | Perfil AWS a ser utilizado.                      | string | `"butrico-devops"` | Sim         |
| `create_vpc`        | Se a VPC será criada.                            | bool   | `true`      | Sim         |
| `vpc_cidr_block`    | CIDR Block da VPC.                               | string | `"10.101.0.0/16"` | Sim         |
| `aws_account_name`  | Nome da conta AWS.                               | string | `"Butrico-devops"` | Sim         |
| `vpc_name`          | Nome da VPC.                                     | string | `"VPC-MGMT"` | Sim         |

### Arquivo `App-Docker.tfvars` (Configuração EC2)

| Nome                | Descrição                                         | Tipo   | Padrão      | Obrigatório |
|---------------------|---------------------------------------------------|--------|-------------|-------------|
| `profile`           | Perfil AWS a ser utilizado.                      | string | `"butrico-devops"` | Sim         |
| `region`            | Região AWS onde os recursos serão criados.       | string | `"us-east-1"` | Sim         |
| `keypair_name`      | Nome do par de chaves para a EC2.                | string | `"kp-cloud"` | Sim         |

## Descrição da Aplicação Docker

A aplicação Docker será executada na instância EC2 provisionada pelo Terraform. O Docker estará configurado para rodar um contêiner com a aplicação desejada, e o Nginx atuará como proxy reverso. O Nginx será configurado para acessar a aplicação na porta interna e fornecer o conteúdo via CloudFront para acesso público.

## URL para Acesso à Aplicação

Após a execução bem-sucedida do Terraform, você pode acessar a aplicação através da seguinte URL do CloudFront:

[https://d22wv7u8wjb1z1.cloudfront.net/](https://d22wv7u8wjb1z1.cloudfront.net/)

## Considerações Finais

Este repositório contém a configuração para a criação de infraestrutura na AWS com o Terraform, incluindo a criação de VPC, sub-redes, EC2, Nginx e CloudFront. Siga o passo a passo para provisionar os recursos e acessar a aplicação.

Se você tiver dúvidas ou precisar de ajustes adicionais, sinta-se à vontade para entrar em contato.
