# Declaracao das variaveis que serao utilizadas
# Caso a variavel possua um valor default, ela sera considerada opcional
variable "region" {
  default = "us-east-1"
}

variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}
