# Create a VPC
module "vpc" {
  source = "github.com/andrewduke51/vpc-module"
  subnet_dmz      = var.subnet_dmz
  subnet_internal = var.subnet_internal
  subnet_vpc      = var.subnet_vpc
}
