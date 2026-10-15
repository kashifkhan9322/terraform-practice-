output "load_balancer_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.app_alb.dns_name
}

output "load_balancer_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.app_alb.arn
}

output "target_group_arn" {
  description = "ARN of the Target Group"
  value       = aws_lb_target_group.app_tg.arn
}
