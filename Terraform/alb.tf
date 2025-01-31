# Data source to check for existing ALB  
data "aws_lb" "existing_alb" {  
  name = "deepseek-alb4"  
}  

# Data source to check for existing Target Group  
data "aws_lb_target_group" "existing_tg" {  
  name = "deepseek-tg4"  
}  

# ALB Security Group  
resource "aws_security_group" "alb_sg" {  
  name_prefix = "alb-sg-"  

  ingress {  
    from_port   = 80  
    to_port     = 80  
    protocol    = "tcp"  
    cidr_blocks = ["0.0.0.0/0"]  
  }  

  ingress {  
    from_port   = 443  
    to_port     = 443  
    protocol    = "tcp"  
    cidr_blocks = ["0.0.0.0/0"]  
  }  

  egress {  
    from_port   = 0  
    to_port     = 0  
    protocol    = "-1"  
    cidr_blocks = ["0.0.0.0/0"]  
  }  
}  

# ALB  
resource "aws_lb" "deepseek_alb" {  
  count              = data.aws_lb.existing_alb.id == null ? 1 : 0  
  name               = "deepseek-alb4"  
  internal           = false  
  load_balancer_type = "application"  
  security_groups    = [aws_security_group.alb_sg.id]  
  subnets            = var.public_subnets  
  enable_deletion_protection = false  

  tags = {  
    Name = "DeepSeek-ALB"  
  }  
}  

# ALB Target Group  
resource "aws_lb_target_group" "deepseek_tg" {  
  count = data.aws_lb_target_group.existing_tg.id == null ? 1 : 0  
  name  = "deepseek-tg4"  
  port  = 5000  
  protocol = "HTTP"  
  vpc_id = var.vpc_id  

  health_check {  
    path                = "/health"  
    interval            = 30  
    timeout             = 5  
    healthy_threshold   = 3  
    unhealthy_threshold = 3  
  }  
}  

# ALB Listener  
resource "aws_lb_listener" "deepseek_listener" {  
  load_balancer_arn = aws_lb.deepseek_alb[0].arn  
  port              = 80  
  protocol          = "HTTP"  

  default_action {  
    type             = "forward"  
    target_group_arn = aws_lb_target_group.deepseek_tg[0].arn  
  }  
}  

# Attach EC2 instance to ALB Target Group  
resource "aws_lb_target_group_attachment" "deepseek_attachment" {  
  target_group_arn = aws_lb_target_group.deepseek_tg[0].arn  
  target_id        = aws_instance.deepseekmodel.id  
  port             = 5000  
}