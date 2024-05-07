data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "dev" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  count                  = length(var.ec2_names)
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.subnets[count.index]
  tags = {
    Name        = var.ec2_names[count.index]
    environment = "dev"
  }
}
