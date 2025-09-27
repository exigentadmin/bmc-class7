resource "aws_instance" "example" {
  ami           = aws_launch_template.this.image_id
  instance_type = aws_launch_template.this.instance_type
  user_data     = filebase64("${path.module}/script.sh")
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
  user_data = "IyEvYmluL2Jhc2gKIyBVc2UgdGhpcyBmb3IgeW91ciB1c2VyIGRhdGEgKHNjcmlwdCBmcm9tIHRvcCB0byBib3R0b20pCiMgaW5zdGFsbCBodHRwZCAoTGludXggMiB2ZXJzaW9uKQp5dW0gdXBkYXRlIC15Cnl1bSBpbnN0YWxsIC15IGh0dHBkCnN5c3RlbWN0bCBzdGFydCBodHRwZApzeXN0ZW1jdGwgZW5hYmxlIGh0dHBkCgojIEdldCB0aGUgSU1EU3YyIHRva2VuClRPS0VOPSQoY3VybCAtWCBQVVQgImh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L2FwaS90b2tlbiIgLUggIlgtYXdzLWVjMi1tZXRhZGF0YS10b2tlbi10dGwtc2Vjb25kczogMjE2MDAiKQoKIyBCYWNrZ3JvdW5kIHRoZSBjdXJsIHJlcXVlc3RzCmN1cmwgLUggIlgtYXdzLWVjMi1tZXRhZGF0YS10b2tlbjogJFRPS0VOIiAtcyBodHRwOi8vMTY5LjI1NC4xNjkuMjU0L2xhdGVzdC9tZXRhLWRhdGEvbG9jYWwtaXB2NCAmPiAvdG1wL2xvY2FsX2lwdjQgJgpjdXJsIC1IICJYLWF3cy1lYzItbWV0YWRhdGEtdG9rZW46ICRUT0tFTiIgLXMgaHR0cDovLzE2OS4yNTQuMTY5LjI1NC9sYXRlc3QvbWV0YS1kYXRhL3BsYWNlbWVudC9hdmFpbGFiaWxpdHktem9uZSAmPiAvdG1wL2F6ICYKY3VybCAtSCAiWC1hd3MtZWMyLW1ldGFkYXRhLXRva2VuOiAkVE9LRU4iIC1zIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9uZXR3b3JrL2ludGVyZmFjZXMvbWFjcy8gJj4gL3RtcC9tYWNpZCAmCndhaXQKCm1hY2lkPSQoY2F0IC90bXAvbWFjaWQpCmxvY2FsX2lwdjQ9JChjYXQgL3RtcC9sb2NhbF9pcHY0KQphej0kKGNhdCAvdG1wL2F6KQp2cGM9JChjdXJsIC1IICJYLWF3cy1lYzItbWV0YWRhdGEtdG9rZW46ICRUT0tFTiIgLXMgaHR0cDovLzE2OS4yNTQuMTY5LjI1NC9sYXRlc3QvbWV0YS1kYXRhL25ldHdvcmsvaW50ZXJmYWNlcy9tYWNzLyR7bWFjaWR9L3ZwYy1pZCkKCmVjaG8gIgo8IWRvY3R5cGUgaHRtbD4KPGh0bWwgbGFuZz1cImVuXCIgY2xhc3M9XCJoLTEwMFwiPgo8aGVhZD4KPHRpdGxlPkRldGFpbHMgZm9yIEVDMiBpbnN0YW5jZTwvdGl0bGU+CjwvaGVhZD4KPGJvZHk+CjxkaXY+CjxoMT5BV1MgSW5zdGFuY2UgRGV0YWlsczwvaDE+CjxoMT5TYW11cmFpIEthdGFuYTwvaDE+Cgo8YnI+CiMgaW5zZXJ0IGFuIGltYWdlIG9yIEdJRgo8aW1nIHNyYz0iaHR0cHM6Ly93d3cueGdpZi5jYy9wcmV2aWV3Lz9jb2RlPURlYWZlbmluZ1NlY3JldElydWthbmRqaWplbGx5ZmlzaCI+Cjxicj4KCjxwPjxiPkluc3RhbmNlIE5hbWU6PC9iPiAkKGhvc3RuYW1lIC1mKSA8L3A+CjxwPjxiPkluc3RhbmNlIFByaXZhdGUgSXAgQWRkcmVzczogPC9iPiAke2xvY2FsX2lwdjR9PC9wPgo8cD48Yj5BdmFpbGFiaWxpdHkgWm9uZTogPC9iPiAke2F6fTwvcD4KPHA+PGI+VmlydHVhbCBQcml2YXRlIENsb3VkIChWUEMpOjwvYj4gJHt2cGN9PC9wPgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+CiIgPiAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWwKCiMgQ2xlYW4gdXAgdGhlIHRlbXAgZmlsZXMKcm0gLWYgL3RtcC9sb2NhbF9pcHY0IC90bXAvYXogL3RtcC9tYWNpZA=="
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