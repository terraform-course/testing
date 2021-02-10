resource "aws_security_group" "teting" {
  name        = "testing"
  description = "testing"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP on port 3000 from everywhere"
    from_port   = 3000
    to_port     = 3000
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
    Name = "testing"
  }
}

data "aws_vpc" "default" {
  default = true
}
