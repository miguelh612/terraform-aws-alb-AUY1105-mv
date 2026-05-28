output "ec2_public_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value = aws_instance.web.public_ip
}

output "alb_dns_name" {
  description = "DNS publico del Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.main.arn
}

output "alb_security_group_id" {
  description = "ID del grupo de seguridad asociado al Application Load Balancer"
  value       = aws_security_group.alb_sg.id
}

output "alb_dns_name" {
  description = "DNS publico del Application Load Balancer"
  value       = aws_lb.main.dns_name
}