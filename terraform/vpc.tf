module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0"

  name = local.name
  cidr = local.vpc_cidr

  azs = local.azs

  public_subnets  = local.public_subnets
  private_subnets = local.private_subnets
  intra_subnets   = local.intra_subnets

  enable_nat_gateway = true

  tags = {
    Name = local.name
  }

  # Disable unnecessary security group creation by using default settings
  # (Make sure your use case doesn't require custom security groups)
  create_default_security_group = false
}
