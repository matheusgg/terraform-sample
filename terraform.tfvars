# Armazena as variaveis que serao passadas para o terraform
# Por padrao o terraform procurara qualquer arquivo chamado terraform.tfvars ou *.auto.tfvars
region = "us-east-1"
amis = {
    us-east-1 = "ami-b374d5a5"
    us-west-2 = "ami-4b32be2b"
}