module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0"

  name = local.name
  cidr = local.vpc_cidr

  azs = local.azs

  # Define subnets
  public_subnets  = local.public_subnets
  private_subnets = local.private_subnets
  intra_subnets   = local.intra_subnets

  # Enable NAT gateway for outbound internet access from private subnets
  enable_nat_gateway = true

  # Optionally, configure tags for the VPC and subnets
  tags = {
    Name        = local.name
    Environment = "dev"  # Adjust as necessary
  }
}
