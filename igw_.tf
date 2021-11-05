# Create and Attach internet gateway

resource "aws_internet_gateway" "new-igw" {
  vpc_id = aws_vpc.new_vpc.id
  tags = {
    Name        = "NEW Internet Gateway"
    Terraform   = "true"
  }
}