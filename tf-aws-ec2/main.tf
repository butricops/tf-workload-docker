terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.10.0"
    }
  }

  backend "s3" {
    bucket  = "butricodevops"
    key     = "mgmt"
    profile = "butrico-devops"
    region  = "us-east-1"
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

module "aws_ec2_instaces" {
  depends_on = [module.key_pair]
  source     = "github.com/butricops/tf-modules//tf-modules-ec2/aws_ec2_instaces"

  for_each = var.instances

  ami                         = each.value.ami
  ebs_block_device            = each.value.ebs_block_device
  enable_eip                  = each.value.enable_eip
  get_password_data           = each.value.get_password_data
  instance_type               = each.value.instance_type
  iam_instance_profile        = each.value.iam_instance_profile
  key_name                    = each.value.key_name
  root_block_device_size      = each.value.root_block_device_size
  root_block_device_type      = each.value.root_block_device_type
  security_groups             = each.value.security_groups
  associate_public_ip_address = each.value.associate_public_ip_address
  subnet_id                   = each.value.subnet_id
  tags                        = each.value.tags
  vpc_id                      = var.vpc_id
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

module "key_pair" {
  source = "github.com/butricops/tf-modules//tf-modules-ec2/key_pair"

  key_name   = var.keypair_name
  public_key = trimspace(tls_private_key.this.public_key_openssh)
}


resource "aws_secretsmanager_secret" "private_key" {
  name = var.keypair_name
}

resource "aws_secretsmanager_secret_version" "private_key" {
  secret_id     = aws_secretsmanager_secret.private_key.id
  secret_string = tls_private_key.this.private_key_pem
}
