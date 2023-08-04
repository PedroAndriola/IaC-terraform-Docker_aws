# IaC-terraform-Docker_aws

Terraform - Provisionamento de Bucket S3 na Amazon AWS com Docker

Este repositório contém os arquivos e instruções para provisionar um bucket S3 na Amazon AWS e configurar um serviço Docker nele usando o Terraform.
Pré-requisitos

    Terraform instalado na sua máquina.
    Credenciais de acesso da AWS (chave de acesso e chave secreta) com permissões para criar recursos do S3 e EC2.
    Docker instalado na sua máquina, caso queira testar a execução localmente.

Instruções de Uso

    Clone este repositório em sua máquina:

bash

git clone https://github.com/SEU_USUARIO/NOME_DO_REPOSITORIO.git
cd NOME_DO_REPOSITORIO

    Crie um arquivo chamado terraform.tfvars e defina suas credenciais da AWS:

hcl

access_key = "SUA_ACCESS_KEY_AQUI"
secret_key = "SUA_SECRET_KEY_AQUI"

    Inicialize o Terraform e aplique o plano:

bash

terraform init
terraform apply

    O Terraform irá solicitar confirmação antes de criar os recursos. Digite "yes" quando solicitado.

    Aguarde a conclusão da execução do Terraform. Após a conclusão, o bucket S3 estará criado na sua conta da AWS.

    Se você deseja testar a execução de um serviço Docker no EC2, vá para o diretório docker_app:

bash

cd docker_app

    Crie uma imagem Docker para sua aplicação seguindo as instruções do seu próprio Dockerfile.

    Faça login no ECR (Amazon Elastic Container Registry) com suas credenciais da AWS:

bash

aws ecr get-login-password --region SUA_REGIAO_AQUI | docker login --username AWS --password-stdin SUA_CONTA_AWS.dkr.ecr.SUA_REGIAO_AQUI.amazonaws.com

    Construa e marque sua imagem Docker com o URI do ECR:

bash

docker build -t SUA_CONTA_AWS.dkr.ecr.SUA_REGIAO_AQUI.amazonaws.com/NOME_DA_IMAGEM:TAG .

    Faça o push da imagem para o ECR:

bash

docker push SUA_CONTA_AWS.dkr.ecr.SUA_REGIAO_AQUI.amazonaws.com/NOME_DA_IMAGEM:TAG

    Volte para o diretório raiz do repositório e execute o Terraform novamente para criar uma instância EC2 e iniciar o serviço Docker:

bash

cd ..
terraform apply

    O Terraform irá solicitar confirmação antes de criar a instância EC2. Digite "yes" quando solicitado.

    Aguarde a conclusão da execução do Terraform. Após a conclusão, você poderá acessar a instância EC2 através do IP público fornecido e verificar se o serviço Docker está em execução.

Limpando os recursos

Para evitar cobranças desnecessárias, lembre-se de destruir os recursos criados quando não estiver mais usando-os:

bash

terraform destroy

Lembre-se de confirmar a destruição digitando "yes" quando solicitado.

Isso encerra o guia para provisionar um bucket S3 na Amazon AWS e configurar um serviço Docker usando o Terraform. Lembre-se de sempre gerenciar suas credenciais com cuidado e ajustar as configurações de acordo com suas necessidades específicas.
