# Public subnet creation
resource "aws_subnet" "pub_sub" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Pubic-subnet-01"
  }
}

# Private subnet creation
resource "aws_subnet" "pri_sub" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private-subnet-01"
  }
}