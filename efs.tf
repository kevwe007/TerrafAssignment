# CREATE EFS SECURITY GROUP

resource "aws_security_group" "new_efs_sg" {
  name = "New EFS Security Group"
  vpc_id = aws_vpc.new_vpc.id
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
    security_groups = [aws_security_group.new_asg_sg.id]
  }
  tags = {
    Name        = "EFS Security Group"
    Terraform   = "true"
  }
}

# CREATE ELASTIC FILE SYSTEM

resource "aws_efs_file_system" "test-efs" {
  creation_token = "test elastic-file-system" 
  performance_mode = "generalPurpose"
  throughput_mode = "bursting"
  tags = {
    Name        = "NEW Elastic File System"
    Terraform   = "true"
  }
}

# CREATE ELASTIC FILE SYSTEM MOUNT TARGETS

resource "aws_efs_mount_target" "new-mount-private-2b" {
  file_system_id = aws_efs_file_system.test-efs.id
  subnet_id      = aws_subnet.new-private-2b.id
  security_groups = [
    aws_security_group.new_efs_sg.id
  ]
}
resource "aws_efs_mount_target" "new-mount-priavte-2c" {
  file_system_id = aws_efs_file_system.test-efs.id
  subnet_id      = aws_subnet.new-private-2c.id
  security_groups = [
    aws_security_group.new_efs_sg.id
  ]
}
