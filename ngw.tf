resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.pub_sub.id

  tags = {
    Name = "gw-NAT"
  }
}

# eip allocation

resource "aws_eip" "my_eip" {
  vpc = true
}