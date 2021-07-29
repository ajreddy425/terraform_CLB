resource "aws_route_table" "pub_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "Public-route"
  }
}

# creation of igw

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-igw"
  }
}

# association of public subnet to the public route table

resource "aws_route_table_association" "pub_asso" {
  subnet_id      = aws_subnet.pub_sub.id
  route_table_id = aws_route_table.pub_route.id
}

# creation of Private route table

resource "aws_route_table" "pri_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw.id
  }

  tags = {
    Name = "my-private-route"
  }
}

# association of private subnet to the private route table

resource "aws_route_table_association" "pri_asso" {
  subnet_id      = aws_subnet.pri_sub.id
  route_table_id = aws_route_table.pri_route.id
}