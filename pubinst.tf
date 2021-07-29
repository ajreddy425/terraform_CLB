
resource "aws_instance" "pub_ins" {
  ami                         = "ami-0742b4e673072066f"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "demokepair"
  subnet_id                   = aws_subnet.pub_sub.id
  vpc_security_group_ids      = [aws_security_group.my_sg.id]
  user_data                   = file("./files/apache1.sh")
  tags = {
    Name = "my_public_instance"
  }
}

# security groups

resource "aws_security_group" "my_sg" {
  name        = "my_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-sg"
  }
}