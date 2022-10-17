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
resource "aws_instance" "control_plane" {
  count                       = var.control_plane
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.control_plane_instance_type
  key_name                    = "ansible"
  associate_public_ip_address = true
  user_data                   = var.user_data != "" ? var.user_data : base64encode(file("${path.module}/templates/user-data.sh"))

  tags = {
    Name = var.tag_name
  }
}
####### NODES  ###################
resource "aws_instance" "nodes" {
  count                       = var.nodes
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.node_instance_type
  key_name                    = "ansible"
  associate_public_ip_address = true
  user_data                   = var.user_data != "" ? var.user_data : base64encode(file("${path.module}/templates/user-data.sh"))

  tags = {
    Name = var.tag_name
  }
}