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
    name = "class7-sg"
  }
}

# resource "aws_security_group_rule" "ingress-http" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 80
#   protocol          = "http"
#   security_group_id = aws_security_group.this.id
# }

# resource "aws_security_group_rule" "ingress-ssh" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 22
#   protocol          = "ssh"
#   security_group_id = aws_security_group.this.id
# }

resource "aws_security_group_rule" "egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  security_group_id = aws_security_group.this.id
  self = true
}

# import {
#   to = aws_security_group_rule.ingress
#   id = "sg-6e616f6d69_ingress_tcp_8000_8000_10.0.3.0/24"
# }

# import {
#   to = aws_security_group_rule.ingress
#   id = "sg-6e616f6d69_ingress_tcp_8000_8000_10.0.3.0/24"
# }

import {
  to = aws_security_group_rule.egress-all
  id = "sg-0baf2ab4ee6d692c2_egress_all_0_0_0.0.0.0/0"
}
