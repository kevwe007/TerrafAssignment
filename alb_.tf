# Create Application Load Balancer Security Group

resource "aws_security_group" "new_alb_sg" {
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
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  tags = {
    Name        = "NEW ALB Security Group"
    Terraform   = "True"   
  } 
}

# Create Application Load Balancer

resource "aws_lb" "new_alb" {
  name               = "new-app-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.new_alb_sg.id]
  subnets = [
    aws_subnet.new-public-2b.id,
    aws_subnet.new-public-2c.id,
  ]
  enable_deletion_protection = false
  tags = {
    Name        = "NEW Application Load Balancer"
    Terraform   = "True"   
  } 
}