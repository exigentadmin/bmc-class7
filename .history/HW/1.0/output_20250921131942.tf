# output "launch_template_data" {
#   value = aws_launch_template.this[*]
# }

output "ami_data" {
    value = data.aws_ami.this[*]
  
}