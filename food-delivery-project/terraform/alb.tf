resource "aws_lb" "alb" {

  name = "foodapp-alb"

  load_balancer_type = "application"

  subnets = module.vpc.public_subnets

  security_groups = [aws_security_group.alb_sg.id]

}
resource "aws_lb_target_group" "tg" {

  port = 80
  protocol = "HTTP"
  vpc_id = module.vpc.vpc_id

}
resource "aws_lb_listener" "listener" {

  load_balancer_arn = aws_lb.alb.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.tg.arn

  }

}
