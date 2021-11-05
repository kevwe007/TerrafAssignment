# Create Security Group for ASG

resource "aws_security_group" "new_asg_sg" {
  vpc_id = aws_vpc.new_vpc.id
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
 ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [
      aws_security_group.new_alb_sg.id
    ]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [
      aws_security_group.new_bastion_sg.id
    ]
  }
  tags = {
    Name        = "NEW ASG Security Group"
    Terraform   = "true"
  } 
}

# Create Launch Configuration

resource "aws_launch_configuration" "new_launch_config" {
  name_prefix   = "NEW Launch Configuration"
  image_id      = "ami-0f19d220602031aed"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.new_asg_sg.id]
  key_name = aws_key_pair.ssh-key.key_name
  lifecycle {
    create_before_destroy = true
  }
}

# Create NEW FrontEnd ASG

resource "aws_autoscaling_group" "new_front_end" {
  name                 = "NEW FrontEnd ASG"
  launch_configuration = aws_launch_configuration.new_launch_config.name
  health_check_type    = "ELB"
  min_size             = 0
  max_size             = 2
  desired_capacity     = 2

  vpc_zone_identifier = [
    aws_subnet.new-private-2b.id,
    aws_subnet.new-private-2c.id
  ]
  target_group_arns = [aws_lb_target_group.new-front-end-tg.arn]
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "New FrontEnd ASG"
    propagate_at_launch = true  
  }
}

# Create NEW Backend ASG

resource "aws_autoscaling_group" "new_back_end" {
  name                 = "NEW BackEnd ASG"
  launch_configuration = aws_launch_configuration.new_launch_config.name
  health_check_type    = "ELB"
  min_size             = 0
  max_size             = 2
  desired_capacity     = 2

  vpc_zone_identifier = [
    aws_subnet.new-private-2b.id,
    aws_subnet.new-private-2c.id
  ]
  target_group_arns = [aws_lb_target_group.new-back-end-tg.arn]
  lifecycle {
    create_before_destroy = true
  }
 tag {
    key                 = "Name"
    value               = "NEW FrontEnd ASG"
    propagate_at_launch = true  
  }
}