# CONTROL PLANE
locals {
  ctrl_user_data = base64encode(templatefile("${path.module}/templates/control_plane.sh.tmpl", {
    INIT                = "placeholder"
    ENV                 = "some_env"
  }))
}
module "dyi_kube_ctrl" {
  source                      = "./modules/ec2"
  tag_name                    = "dyi-kube"
  ec2                         = 1
  instance_type               = "t2.small"
  user_data                   = local.ctrl_user_data
  subnet_id                   = module.vpc.subnet_internal
}
# NODES
locals {
  nodes_user_data = base64encode(templatefile("${path.module}/templates/nodes.sh.tmpl", {
    INIT                = "placeholder"
    ENV                 = "some_env"
  }))
}
module "dyi_kube_cluster" {
  source                      = "./modules/ec2"
  tag_name                    = "dyi-kube"
  instance_type               = "t2.small"
  ec2                         = 0
  user_data                   = local.nodes_user_data
  subnet_id                   = module.vpc.subnet_internal
}