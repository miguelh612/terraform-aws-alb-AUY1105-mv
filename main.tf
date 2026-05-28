# ─── SECURITY GROUP — ALB ──────────────────────────────────────────────────────
resource "aws_security_group" "alb" {
  name        = var.alb_security_group_name
  description = "Permite trafico HTTP entrante al ALB desde Internet"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP desde Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.public_cidr_block]
  }

  tags = {
    Name = "sg-alb"
  }
}

# ─── APPLICATION LOAD BALANCER ────────────────────────────────────────────────
resource "aws_lb" "main" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [var.public_subnet_id, var.public_subnet_2_id]

  enable_deletion_protection = false

  tags = {
    Name        = var.alb_name
    Environment = "dev"
  }
}

# ─── TARGET GROUP ─────────────────────────────────────────────────────────────
resource "aws_lb_target_group" "web" {
  name     = "tg-web-prueba2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "tg-web-prueba2"
  }
}

# ─── REGISTRO DE LA EC2 EN EL TARGET GROUP ────────────────────────────────────
resource "aws_lb_target_group_attachment" "web" {
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = var.ec2_instance_id
  port             = 80
}

# ─── LISTENER HTTP ────────────────────────────────────────────────────────────
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}