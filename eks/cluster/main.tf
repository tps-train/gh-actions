provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "eks-vpc"
  cidr = "192.168.0.0/16"

  azs             = ["us-east-1a"]
  private_subnets = ["192.168.0.0/19","192.168.1.0/19","192.168.2.0/19"]
  public_subnets  = ["192.168.3.0/19","192.168.4.0/19","192.168.5.0/19"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "single-node-eks-cluster"
  cluster_version = "1.32"

  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.private_subnets
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    single_node = {
      instance_types = ["t3.medium"]
      desired_size   = 1
      min_size       = 1
      max_size       = 1
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
    Name = "single-node-eks"
  }
}   