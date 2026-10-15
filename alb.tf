resource "aws_lb" "app_alb" {
  name               = "terraform-app-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.alb_sg.id]
  subnets         = var.public_subnet_ids

  tags = {
    Name = "terraform-app-alb"
  }
}

resource "aws_lb_target_group" "app_tg" {
  name        = "terraform-app-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200-399"
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "terraform-app-tg"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
