resource "aws_launch_template" "web_app_launch_template" {
  for_each = {
    for index, subnet in module.network.subnet_ids:
        subnet.subnet_az => subnet.subnet_id
  }
  name                   = "${var.application_name}-launch_template-${each.key}"
  image_id               = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  tags = {
    availability_zone = each.key
  }
  network_interfaces {
    subnet_id = each.value
    security_groups = [aws_security_group.application_server_security_group.id]
  }

  user_data = filebase64("user_data.sh")
}

resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "${var.application_name}-node-"
  image_id      = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}
