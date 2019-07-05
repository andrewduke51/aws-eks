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
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.main_vpc.id}"
}

resource "aws_nat_gateway" "aws_nat_gateway" {
  allocation_id = "${aws_eip.nat_eip.allocation_id}"
  subnet_id = "${aws_subnet.subnet_dmz}"
  depends_on = ["aws_internet_gateway.internet_gateway", "aws_internet_gateway.internet_gateway"]
}

# EIP
resource "aws_eip" "nat_eip" {
  vpc = true
}
