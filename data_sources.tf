# sytrue-advantasure-<env> #
data "external" "current_ip" {
  program = ["python", "${path.module}/ops/ip.py" ]
}
data "aws_vpc" "vpc_cidr" {
  id = module.vpc.vpc_id
}