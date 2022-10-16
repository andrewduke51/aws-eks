# sytrue-advantasure-<env> #
data "external" "current_ip" {
  program = ["python", "${path.module}/ops/ip.py" ]
}