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

resource "aws_security_group_rule" "ingress-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "ingress-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.this.id
  cidr_blocks       = ["0.0.0.0/0"]
}

# import {
#   to = aws_security_group_rule.ingress-ssh
#   id = "sg-0baf2ab4ee6d692c2_ingress_22_0_22_0.0.0.0/0"
#   # SECURITYGROUPID_TYPE_PROTOCOL_FROMPORT_TOPORT_SOURCE[_SOURCE]*: protocol must be tcp/udp/icmp/icmpv6/all or a number
# }

resource "aws_security_group_rule" "egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  security_group_id = aws_security_group.this.id
  cidr_blocks       = ["0.0.0.0/0"]
}




