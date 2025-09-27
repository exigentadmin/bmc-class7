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
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "ingress-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  security_group_id = aws_security_group.this.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_launch_template" "this" {
    name = "sshandhomepage"
}

import {
  to = aws_launch_template.this
  id = "lt-0b575978357645e3f"
}



# Create a new host with instance type of c5.18xlarge with Auto Placement
# and Host Recovery enabled.
# resource "aws_ec2_host" "this" {
#   instance_type     = "c5.18xlarge"
#   availability_zone = "us-west-2a"
#   host_recovery     = "on"
#   auto_placement    = "on"
# }






