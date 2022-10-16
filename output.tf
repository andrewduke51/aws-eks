output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_dmz" {
  value = module.vpc.subnet_dmz
}

output "subnet_internal" {
  value = module.vpc.subnet_internal
}

output "nat_gateway_id" {
  value = module.vpc.nat_gateway_id
}

output "nat_gateway_eni" {
  value = module.vpc.nat_gateway_eni
}