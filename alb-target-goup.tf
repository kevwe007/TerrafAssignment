# Create Frontend Target Group

resource "aws_lb_target_group" "new-front-end-tg" {
  port = 80
  protocol = "HTTP"
  name = "new-front-end-target-group"
  vpc_id = aws_vpc.new_vpc.id
  stickiness {
    type = "lb_cookie"
    enabled = true
  }
  health_check {
    protocol = "HTTP"
    path = "/healthy.html"
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    interval = 10
  }
  tags = {
    Name        = "NEW Front End Target Group"
    Terraform   = "True"   
  } 
}

# Create Backend Target Group


resource "aws_lb_target_group" "new-back-end-tg" {
  port = 80
  protocol = "HTTP"
  name = "new-back-end-target-group"
  vpc_id = aws_vpc.new_vpc.id
  stickiness {
    type = "lb_cookie"
    enabled = true
  }
  health_check {
    protocol = "HTTP"
    path = "/healthy.html"
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    interval = 10
  }
  tags = {
    Name        = "NEW Back End Target Group"
    Terraform   = "True"   
  } 
}