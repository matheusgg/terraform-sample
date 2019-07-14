provider "aws" {
  profile    = "default"
  # Para utilizar uma variavel basta usar o prefixo 'var.'
  region     = var.region
}

terraform {
  backend "s3" {
    bucket = "terraform-e1ca5769-ae2a-43bd-8999-b34129fcf9fa"
    key    = "tf/states"
    region = "us-east-1"
  }
}

# O prefixo 'aws_' identifica o provider desse recurso
resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"

  # Commando que sera executado na inicializacao do recurso na maquina onde o terraform esta rodando
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = aws_instance.example.id
}

output "ami" {
  value = aws_instance.example.ami
}

output "amis" {
  value = var.amis
}

output "ip" {
  value = aws_eip.ip.public_ip
}