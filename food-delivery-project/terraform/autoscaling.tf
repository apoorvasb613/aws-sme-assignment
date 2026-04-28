resource "aws_autoscaling_group" "asg" {

  name = "foodapp-asg"

  desired_capacity = 1
  min_size         = 1
  max_size         = 1

  vpc_zone_identifier = module.vpc.private_subnets

  launch_template {
    id      = aws_launch_template.app.id
    version = aws_launch_template.app.latest_version
  }

  target_group_arns = [aws_lb_target_group.tg.arn]

  health_check_type = "EC2"

  tag {
    key                 = "Name"
    value               = "foodapp-instance"
    propagate_at_launch = true
  }

}
