variable "bucket_name" {
  description = "Nome do bucket que será criado"
  type = string
  default = "bucket-treinamento-terraform-diego"
}

variable "aws__resource_region" {
  description = "Região que o bucket será criado"
  type = string
  default = "us-east-1"
}