
resource "aws_instance" "pri_ins" {
  ami                    = "ami-0742b4e673072066f"
  instance_type          = "t2.micro"
  key_name               = "demokepair"
  subnet_id              = aws_subnet.pri_sub.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  user_data              = file("./files/apache2.sh")
  tags = {
    Name = "my_private_instance"
  }
}


