variable "alb_security_group_name" {
  description = "Nombre del grupo de seguridad para el Application Load Balancer"
  type = string
  default = "test01-sg-alb"
  
}

variable "public_cidr_block" {
  description = "CIDR block para la subred pública"
  type = string
  default = "0.0.0.0/0"
}

variable "alb_name" {
  description = "Nombre del Application Load Balancer"
  type = string
  default = "alb-prueba2"
}

variable "vpc_id" {
  description = "ID de la VPC creada"
  type = string
}

variable "public_subnet_id" {
  description = "ID de la subred pública"
  type = string
}

variable "public_subnet_2_id" {
  description = "ID de la subred pública 2"
  type = string
}

variable "ec2_instance_id" {
  description = "ID de la instancia EC2 a asociar al ALB"
  type = string
}