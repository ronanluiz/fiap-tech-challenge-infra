resource "aws_lb" "alb" {
  name            = "${local.projeto}-alb"
  security_groups = [aws_security_group.alb.id]
  subnets         = flatten([module.vpc.public_subnets])
}

resource "aws_lb_listener" "http_port_80" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ip_port_80.arn
  }
}

resource "aws_lb_target_group" "ip_port_80" {
  name        = "${local.projeto}-alb"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = module.vpc.vpc_id
}

