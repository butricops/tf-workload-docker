profile          = "butrico-devops"
create_vpc       = "true"
vpc_cidr_block   = "10.101.0.0/16"
aws_account_name = "Butrico-devops"
vpc_name         = "VPC-MGMT"
vpc_tags = {
  "Projeto"     = "GitOps",
  "Environment" = "MGMT"
}
enable_dns_support     = "true"
enable_dns_hostname    = "false"
azs                    = 4
nat_gateway_deployment = "fixed"
region                 = "us-east-1"
custom_subnets_cidrs = [
  ["10.101.0.0/19", "10.101.32.0/19", "10.101.64.0/19", "10.101.96.0/19"],     # Private
  [],                                                                          # Isolated
  ["10.101.128.0/19", "10.101.160.0/19", "10.101.192.0/19", "10.101.224.0/19"] # Public
]
