# Create first private route table and associate it with private subnet in us-east-2a
 
resource "aws_route_table" "new_private_route_table_2a" {
    vpc_id = aws_vpc.new_vpc.id
    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.new-nat-gateway-2a.id
  }
    tags =  {
        Name      = "New Private route table 2A"
        Terraform = "True"
  }
}
 
resource "aws_route_table_association" "new-2a" {
    subnet_id = aws_subnet.new-private-2a.id
    route_table_id = aws_route_table.new_private_route_table_2a.id
}
 
# Create second private route table and associate it with private subnet in us-east-2b 
 
resource "aws_route_table" "new_private_route_table_2b" {
    vpc_id = aws_vpc.new_vpc.id
    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.new-nat-gateway-2b.id
  }
    tags =  {
        Name      = "New Private route table 2B"
        Terraform = "True"
  }
}
 
resource "aws_route_table_association" "new-2b" {
    subnet_id = aws_subnet.new-private-2b.id
    route_table_id = aws_route_table.new_private_route_table_2b.id
}

# Create third private route table and associate it with private subnet in us-east-2c 
 
resource "aws_route_table" "new_private_route_table_2c" {
    vpc_id = aws_vpc.new_vpc.id
    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.new-nat-gateway-2c.id
  }
    tags =  {
        Name      = "New Private route table 2c"
        Terraform = "True"
  }
}
 
resource "aws_route_table_association" "new-2c" {
    subnet_id = aws_subnet.new-private-2c.id
    route_table_id = aws_route_table.new_private_route_table_2c.id
}