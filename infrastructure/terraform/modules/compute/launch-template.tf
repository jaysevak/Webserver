terraform
resource "aws_launch_template" "webapp" {
  name_prefix   = "webapp-lt-"
  image_id      = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.key_pair

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  user_data = base64encode(file("${path.module}/../../../application/scripts/user-data.sh"))

  network_interfaces {
    security_groups = [var.security_group_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "webapp-instance"
    }
  }
}
