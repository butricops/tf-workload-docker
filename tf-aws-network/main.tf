terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.10.0"
    }
  }

  backend "s3" {
    bucket  = "butricodevops"
    key     = "network"
    profile = "butrico-devops"
    region  = "us-east-1"
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

module "vpc" {
  source = "github.com/butricops/tf-modules//tf-modules-network/aws_network"
  count  = var.create_vpc ? 1 : 0

  vpc_cidr_block         = var.vpc_cidr_block
  aws_account_name       = var.aws_account_name
  vpc_name               = var.vpc_name
  enable_dns_support     = var.enable_dns_support
  enable_dns_hostname    = var.enable_dns_hostname
  vpc_tags               = var.vpc_tags
  azs                    = var.azs
  custom_subnets_cidrs   = var.custom_subnets_cidrs
  private_mask           = var.private_mask
  isolated_mask          = var.isolated_mask
  public_mask            = var.public_mask
  nat_gateway_deployment = var.nat_gateway_deployment
}
