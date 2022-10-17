#module "dyi_kube_cluster" {
#  source                      = "./modules/ec2"
#  tag_name                    = "dyi-kube"
#  control_plane               = 4
#  nodes                       = 0
#  control_plane_instance_type = "t2.small"
#  node_instance_type          = "t2.small"
#}