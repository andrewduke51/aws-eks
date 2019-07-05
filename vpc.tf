# Create a VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "${var.subnet_vpc}"
}

# subnet dmz
resource "aws_subnet" "subnet_dmz" {
  cidr_block = "${var.subnet_dmz}"
  vpc_id = "${aws_vpc.main_vpc.id}"
}

# subnet internal
resource "aws_subnet" "subnet_internal" {
  cidr_block = "${var.subnet_internal}"
  vpc_id = "${aws_vpc.main_vpc.id}"
}

# internet gateway
resource "aws_nat_gateway" "nat_gatewat" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${aws_subnet.subnet_dmz.id}"
  depends_on = ["aws_eip.nat_eip"]

  tags = {
    Name = "gw NAT"
  }
}

# EIP
resource "aws_eip" "nat_eip" {
  vpc = true
}
