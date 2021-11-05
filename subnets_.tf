# Create Public Subnets

resource "aws_subnet" "new-public-2a" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = "true"
  tags = {
    Name        = "New Public Subnet - 2a"
    Terraform   = "True"
  }
}
resource "aws_subnet" "new-public-2b" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = "true"
  tags = {
    Name        = "New Public Subnet - 2B"
    Terraform   = "True"
  }
}
resource "aws_subnet" "new-public-2c" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-2c"
  map_public_ip_on_launch = "true"
  tags = {
    Name        = "New Public Subnet - 2C"
    Terraform   = "True"
  }
}


# Create Private Subnets

resource "aws_subnet" "new-private-2a" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = "false"
  tags = {
    Name        = "New Private Subnet - 2a"
    Terraform   = "True"
  }
}  

resource "aws_subnet" "new-private-2b" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = "false"
  tags = {
    Name        = "New Private Subnet - 2B"
    Terraform   = "True"
  }
}

resource "aws_subnet" "new-private-2c" {
  vpc_id = aws_vpc.new_vpc.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "us-east-2c"
  map_public_ip_on_launch = "false"
  tags = {
    Name        = "NewPrivate Subnet - 2C"
    Terraform   = "True"
  }
}
