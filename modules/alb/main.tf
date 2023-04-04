resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnets_ids[*]
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.alb_listener_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_target_group" "tg" {
  name        = "tg"
  port        = var.target_group_port
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
}

resource "aws_lb_target_group_attachment" "tg_attach" {
  count            = length(var.ec2_isntances_ids)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.ec2_isntances_ids[count.index]
  port             = var.target_group_port
}
