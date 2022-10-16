# Create a VPC using a remote module in github
module "vpc" {
  source = "git::https://github.com/andrewduke51/vpc-module.git"
  subnet_dmz      = var.subnet_dmz
  subnet_internal = var.subnet_internal
  subnet_vpc      = var.subnet_vpc
}
