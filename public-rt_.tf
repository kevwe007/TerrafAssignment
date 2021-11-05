# Create a public route table for Public Subnets
 
resource "aws_route_table" "new-public" {
  vpc_id = aws_vpc.new_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.new-igw.id
  }
  tags = {
    Name        = "New Public Route Table"
    Terraform   = "true"
    }
}
 
# Attach a public route table to Public Subnets

resource "aws_route_table_association" "new-public-2a-association" {
  subnet_id = aws_subnet.new-public-2a.id
  route_table_id = aws_route_table.new-public.id
}
 
resource "aws_route_table_association" "new-public-2b-association" {
  subnet_id = aws_subnet.new-public-2b.id
  route_table_id = aws_route_table.new-public.id
}
 
resource "aws_route_table_association" "new-public-2c-association" {
  subnet_id = aws_subnet.new-public-2c.id
  route_table_id = aws_route_table.new-public.id
}