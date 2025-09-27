data "aws_ami" "this" {

  filter {
    name   = "arn"
    values                 = ["arn:aws:ec2:us-east-1::image/ami-08982f1c5bf93d976"]
  }

  #
}

# resource "aws_instance" "example" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
# }

# resource "aws_instance" "this" {

#   launch_template {
#     id      = aws_launch_template.this.id
#     version = "5" # Use "$Latest" for the latest version or a specific version number
#   }

#  # subnet_id = "subnet-0abcdef1234567890" # Replace with your desired subnet ID

# #   tags = {
# #     Name = "MyLaunchTemplateInstance"
# #   }
#





