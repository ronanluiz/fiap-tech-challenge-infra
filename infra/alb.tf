resource "aws_lb" "alb_techchallenge" {
  name            = "alb-techchallenge-${vars.ambiente}"
  security_groups = [aws_security_group.alb.id]
  subnets         = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
}

resource "aws_lb_listener" "http_port_80" {
  load_balancer_arn = aws_lb.alb_techchallenge.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ip_port_80.arn
  }
}

resource "aws_lb_target_group" "ip_port_80" {
  name        = "alb-techchallenge-${vars.ambiente}"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = module.vpc.vpc_id
}

output "alb_dns_name" {
  value = aws_lb.alb_techchallenge.dns_name
}