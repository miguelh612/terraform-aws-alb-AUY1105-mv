output "ec2_public_ip" {
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
