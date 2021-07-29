resource "aws_elb" "my_elb" {
  name            = "my-elb-terraform"
  security_groups = [aws_security_group.my_sg.id]
  subnets         = [aws_subnet.pub_sub.id,aws_subnet.pri_sub.id]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = [aws_instance.pub_ins.id,aws_instance.pri_ins.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "my-terraform-elb"
  }
}