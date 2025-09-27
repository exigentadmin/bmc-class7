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
  default_version                      = 1
  description             = "addphoto"
  disable_api_stop        = false
  disable_api_termination = false
  ebs_optimized           = "true"
#  id                                   = "lt-0b575978357645e3f"
  image_id                             = "ami-08982f1c5bf93d976"
  instance_initiated_shutdown_behavior = "stop"

  instance_type                        = "t3.micro"
  kernel_id                            = null
  key_name                             = "sshandhomepage"
#  latest_version                       = 4
  name        = "sshandhomepage"
  name_prefix = null
  ram_disk_id = null
  region      = "us-east-1"
#  security_group_names                 = toset([])
  tags      = {}
  tags_all  = {}
  user_data = "#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Get the IMDSv2 token
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Background the curl requests
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
wait

macid=$(cat /tmp/macid)
local_ipv4=$(cat /tmp/local_ipv4)
az=$(cat /tmp/az)
vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/${macid}/vpc-id)

echo "
<!doctype html>
<html lang=\"en\" class=\"h-100\">
<head>
<title>Details for EC2 instance</title>
</head>
<body>
<div>
<h1>AWS Instance Details</h1>
<h1>Samurai Katana</h1>
<h1>I, Freedman, Thank Theo And Jules, For Teaching Me About Ec2s In Aws. One Step Closer To Escaping Keisha!</h1>
<h1>With This Class, I Will Net $800,000 Per Year!"</h1>


<br>
# insert an image or GIF
<img src="https://www.w3schools.com/images/w3schools_green.jpg" alt="W3Schools.com">
<br>

<p><b>Instance Name:</b> $(hostname -f) </p>
<p><b>Instance Private Ip Address: </b> ${local_ipv4}</p>
<p><b>Availability Zone: </b> ${az}</p>
<p><b>Virtual Private Cloud (VPC):</b> ${vpc}</p>
</div>
</body>
</html>
" > /var/www/html/index.html

# Clean up the temp files
rm -f /tmp/local_ipv4 /tmp/az /tmp/macid"
#  vpc_security_group_ids               = toset([])

  block_device_mappings {
    device_name  = "/dev/xvda"
    no_device    = null
    virtual_name = null

    ebs {
      delete_on_termination      = "true"
      encrypted                  = "false"
      iops                       = 3000
      kms_key_id                 = null
      snapshot_id                = null
      throughput                 = 125
      volume_initialization_rate = 100
      volume_size                = 8
      volume_type                = "gp3"
    }
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  enclave_options {
    enabled = false
  }

  hibernation_options {
    configured = false
  }

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring {
    enabled = false
  }

  network_interfaces {
    associate_carrier_ip_address = null
    associate_public_ip_address  = "true"
    delete_on_termination        = "true"
    description                  = null
    device_index                 = 0
    interface_type               = "interface"
    ipv4_address_count           = 0
    ipv4_addresses               = []
    ipv4_prefix_count            = 0
    ipv4_prefixes                = []
    ipv6_address_count           = 0
    ipv6_addresses               = []
    ipv6_prefix_count            = 0
    ipv6_prefixes                = []
    network_card_index           = 0
    network_interface_id         = null
    primary_ipv6                 = null
    private_ip_address           = null
    security_groups = [
      "sg-0baf2ab4ee6d692c2",
    ]
    subnet_id = "subnet-0923c1eaadbb7f121"
  }

  placement {
    affinity                = null
    availability_zone       = null
    group_id                = null
    group_name              = null
    host_id                 = null
    host_resource_group_arn = null
    partition_number        = 0
    spread_domain           = null
    tenancy                 = "default"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      "Name" = "sshandhomepage"
    }
  }
}




# Create a new host with instance type of c5.18xlarge with Auto Placement
# and Host Recovery enabled.
# resource "aws_ec2_host" "this" {
#   instance_type     = "c5.18xlarge"
#   availability_zone = "us-west-2a"
#   host_recovery     = "on"
#   auto_placement    = "on"
# }






