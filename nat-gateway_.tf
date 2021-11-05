# CREATE ELASTIC IP ADDRESS FOR NAT GATEWAY

  resource "aws_eip" "new-nat1" {
}
resource "aws_eip" "new-nat2" {
}
resource "aws_eip" "new-nat3" {
}

# CREATE NAT GATEWAY in US-East-2A

  resource "aws_nat_gateway" "new-nat-gateway-2a" {
  allocation_id = aws_eip.new-nat1.id
  subnet_id     = aws_subnet.new-public-2a.id

  tags = {
    Name        = "Nat Gateway-2a"
    Terraform   = "True"
  }
}
# CREATE NAT GATEWAY in US-East-2B

resource "aws_nat_gateway" "new-nat-gateway-2b" {
  allocation_id = aws_eip.new-nat2.id
  subnet_id     = aws_subnet.new-public-2b.id

  tags = {
    Name        = "Nat Gateway-2b"
    Terraform   = "True"
  }
}# CREATE NAT GATEWAY in US-East-2C

resource "aws_nat_gateway" "new-nat-gateway-2c" {
  allocation_id = aws_eip.new-nat3.id
  subnet_id     = aws_subnet.new-public-2c.id

  tags = {
    Name        = "Nat Gateway-2c"
    Terraform   = "True"
  }
}