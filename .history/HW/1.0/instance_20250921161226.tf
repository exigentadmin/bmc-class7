data "aws_ami" "this" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.8.20250915.0-kernel-6.1-x86_64"]
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
  key_name = "demo-class-7"

  tags = {
    Name = "HelloWorld"
  }
}





