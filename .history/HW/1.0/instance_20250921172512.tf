data "aws_ami" "this" {
  most_recent = true

  filter {
    name   = "name"
    values = var.name
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}

resource "aws_instance" "this" {
  ami           = data.aws_ami.this.id
  instance_type = "t3.micro"
  key_name = var.name # Make key pair in the future

  tags = { 
    Name = "HelloWorld"
  }
}





