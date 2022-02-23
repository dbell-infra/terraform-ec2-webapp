resource "aws_autoscaling_group" "webapp_asg" {
  for_each = aws_launch_template.web_app_launch_template
  availability_zones = [each.value.tags.availability_zone]
  desired_capacity   = var.autoscaling.az_desired
  max_size           = var.autoscaling.az_max
  min_size           = var.autoscaling.az_min
  target_group_arns = [aws_lb_target_group.webapp_tg.arn]

  launch_template {
    id      = each.value.id
    version = "$Latest"
  }
}
