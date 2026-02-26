variable "name" {
  description = "Nome base da infraestrutura"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Lista de availability zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de subnets privadas"
  type        = list(string)
}

variable "public_subnets" {
  description = "Lista de subnets públicas"
  type        = list(string)
}

variable "tags" {
  description = "Tags globais"
  type        = map(string)
  default     = {}
}