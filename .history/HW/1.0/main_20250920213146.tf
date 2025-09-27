resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "this" {
  name        = "Class7"
  description = "Class7"
  vpc_id      = aws_default_vpc.default.id

  tags = {
    Name = "class7-sg"
  }
}

resource "aws_security_group_rule" "ingress-http" {
  type              = "ingress"
  from_port         = 0
  to_port           = 80
  protocol          = "http"
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "ingress-ssh" {
  type              = "ingress"
  from_port         = 0
  to_port           = 22
  protocol          = "ssh"
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  security_group_id = aws_security_group.this.id
}
