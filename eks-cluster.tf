# DESTROYED IN FAVOR OF DYI KUBERNETES (CHEAPER) ##
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.30.2"

  cluster_name    = local.cluster_name
  cluster_version = local.kube_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = [
    module.vpc.subnet_internal,
    module.vpc.subnet_dmz
  ]

  eks_managed_node_group_defaults = {
    ami_type = local.ami_type_kube

    attach_cluster_primary_security_group = true

    # Disabling and using externally provided security groups
    create_security_group = false
  }

  eks_managed_node_groups = {
    one = {
      name = "default-node-group"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2

      pre_bootstrap_user_data = <<-EOT
      echo 'placeholder'
      EOT

      vpc_security_group_ids = [
        aws_security_group.allow_nodes.id
      ]
    }
  }
}