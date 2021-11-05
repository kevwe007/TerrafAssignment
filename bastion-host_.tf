# Create Bastion Host Security Group

resource "aws_security_group" "new_bastion_sg" {
  vpc_id = aws_vpc.new_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  tags = {
    Name        = "NEW Bastion Security Group"
    Terraform   = "true"
    } 
}


# CREATE BASTION HOST IN US-EAST-2A PUBLIC SUBNET

resource "aws_instance" "new_bastion_host-2a" {
  ami = "ami-0f19d220602031aed"
  instance_type = "t2.micro"
  key_name = aws_key_pair.ssh-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.new_bastion_sg.id]
  subnet_id = aws_subnet.new-public-2a.id
  tags = {
    Name = "NEW Bastion Host - 2A"
    Terraform = true
  }
}
