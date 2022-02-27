resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "${var.application_name}-node-"
  image_id      = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"

  user_data = <<EOF
#! /bin/bash
mkdir webapp && cd webapp
touch index.html && echo "<h1>Hello World!</h1><br> app version ${var.application_version}" > index.html
python3 -m http.server
EOF

  security_groups = [aws_security_group.application_server_security_group.id]



  lifecycle {
    create_before_destroy = true
  }
}
