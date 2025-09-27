data "aws_ami" "this" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.this.id
  instance_type          = "t3.micro"
  key_name               = var.name # Make key pair in the future
  user_data              = filebase64("${path.module}/script.sh")
  vpc_security_group_ids = [aws_security_group.this.id]

  tags = {
    Name = var.name
  }

}





