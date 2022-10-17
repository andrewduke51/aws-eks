resource "aws_security_group" "allow_tls" {
  name        = "allow_from_origin"
  description = "Allow inbound traffic origin"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["${lookup(data.external.current_ip.result, "current_ip_addr", null)}/32"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
### NODES ##
resource "aws_security_group" "allow_nodes" {
  name        = "nodes"
  description = "Allow inbound traffic from subnets"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.vpc_cidr.cidr_block]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}