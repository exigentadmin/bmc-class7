# resource "aws_launch_template" "this" {
#   default_version         = 1
#   description             = "addphoto"
#   disable_api_stop        = false
#   disable_api_termination = false
#   ebs_optimized           = "true"
#   #  id                                   = "lt-0b575978357645e3f"
#   image_id                             = "ami-08982f1c5bf93d976"
#   instance_initiated_shutdown_behavior = "stop"

#   instance_type = "t3.micro"
#   kernel_id     = null
#   key_name      = "sshandhomepage"
#   #  latest_version                       = 4
#   name        = "sshandhomepage"
#   name_prefix = null
#   ram_disk_id = null
#   region      = "us-east-1"
#   #  security_group_names                 = toset([])
#   tags      = {}
#   tags_all  = {}
#   user_data = filebase64("${path.module}/script.sh")
#   #  vpc_security_group_ids               = toset([])

#   block_device_mappings {
#     device_name  = "/dev/xvda"
#     no_device    = null
#     virtual_name = null

#     ebs {
#       delete_on_termination      = "true"
#       encrypted                  = "false"
#       iops                       = 3000
#       kms_key_id                 = null
#       snapshot_id                = null
#       throughput                 = 125
#       volume_initialization_rate = 100
#       volume_size                = 8
#       volume_type                = "gp3"
#     }
#   }

#   capacity_reservation_specification {
#     capacity_reservation_preference = "open"
#   }

#   credit_specification {
#     cpu_credits = "unlimited"
#   }

#   enclave_options {
#     enabled = false
#   }

#   hibernation_options {
#     configured = false
#   }

#   maintenance_options {
#     auto_recovery = "default"
#   }

#   metadata_options {
#     http_endpoint               = "enabled"
#     http_protocol_ipv6          = "disabled"
#     http_put_response_hop_limit = 2
#     http_tokens                 = "required"
#     instance_metadata_tags      = "disabled"
#   }

#   monitoring {
#     enabled = false
#   }

#   network_interfaces {
#     associate_carrier_ip_address = null
#     associate_public_ip_address  = "true"
#     delete_on_termination        = "true"
#     description                  = null
#     device_index                 = 0
#     interface_type               = "interface"
#     ipv4_address_count           = 0
#     ipv4_addresses               = []
#     ipv4_prefix_count            = 0
#     ipv4_prefixes                = []
#     ipv6_address_count           = 0
#     ipv6_addresses               = []
#     ipv6_prefix_count            = 0
#     ipv6_prefixes                = []
#     network_card_index           = 0
#     network_interface_id         = null
#     primary_ipv6                 = null
#     private_ip_address           = null
#     security_groups = [
#       "sg-0baf2ab4ee6d692c2",
#     ]
#     subnet_id = "subnet-0923c1eaadbb7f121"
#   }

#   placement {
#     affinity                = null
#     availability_zone       = null
#     group_id                = null
#     group_name              = null
#     host_id                 = null
#     host_resource_group_arn = null
#     partition_number        = 0
#     spread_domain           = null
#     tenancy                 = "default"
#   }

#   private_dns_name_options {
#     enable_resource_name_dns_a_record    = true
#     enable_resource_name_dns_aaaa_record = false
#     hostname_type                        = "ip-name"
#   }

#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       "Name" = "sshandhomepage"
#     }
#   }

# }