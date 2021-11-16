# CREATE ELASTIC IP ADDRESS FOR NAT GATEWAY

  resource "aws_eip" "new-nat1" {
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