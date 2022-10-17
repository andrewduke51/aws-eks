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

  owners = ["099720109477"] # Canonical
}
####### CONTROL PLANE ############
resource "aws_instance" "ec2" {
  count                       = var.ec2
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = "ansible"
  associate_public_ip_address = true
  user_data                   = var.user_data != "" ? var.user_data : base64encode(file("${path.module}/templates/user-data.sh"))
  subnet_id                   = var.subnet_id

  tags = {
    Name = var.tag_name
  }
}