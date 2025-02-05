output "vpc" {
  value       = module.vpc.0.vpc
  description = "All VPC resource attributes."
}

output "vpc_id" {
  value       = module.vpc.0.vpc_id
  description = "The VPC id."
}

output "public_subnets" {
  value       = module.vpc.0.public_subnets
  description = "All informations about the public subnet resources."
}

output "private_subnets" {
  value       = module.vpc.0.private_subnets
  description = "All information about the private subnet resources."
}

output "isolated_subnets" {
  value       = module.vpc.0.isolated_subnets
  description = "All information about the isolated subnet resources."
}

output "internet_gateway_id" {
  value       = module.vpc.0.internet_gateway_id
  description = "The id of the internet gateway."
}

output "elastic_ip" {
  value       = module.vpc.0.elastic_ip
  description = "informations about the elastic ips for nat gateway."
}

output "nat_gateway" {
  value       = module.vpc.0.nat_gateway
  description = "Information about nat gateway resources"
}

output "public_route_table" {
  value       = module.vpc.0.public_route_table
  description = "Informations about the public route table."
}

output "private_route_table" {
  value       = module.vpc.0.private_route_table
  description = "Informations about the private route table(s)."
}

output "isolated_route_table" {
  value       = module.vpc.0.isolated_route_table
  description = "Informations about the isolated route table."
}

output "subnet_cidrs" {
  value       = module.vpc.0.subnet_cidrs
  description = "Information about subnet cidrs"
}

# output "transit_gateway" {
#   value       = try(module.transit_gateway.0.transit_gateway, null)
#   description = "Information about transit gateway"
# }

# output "transit_gateway_routes" {
#   value       = try(module.transit_gateway.0.aws_transit_gateway_routes, null)
#   description = "Information about transit gateway routes"
# }

# output "transit_gateway_attachment" {
#   value       = try(module.transit_gateway.0.transit_gateway_attachment, null)
#   description = "Information about tranist gateway attachment"
# }

# output "vpn_info" {
#   value       = try(module.vpn.0.vpn_connection, null)
#   description = "Information about vpn connection"
#   sensitive   = true
# }

# output "vgw" {
#   value       = try(module.vpn.0.vgw, null)
#   description = "Information about vgw vpn connection"
# }

# output "cgw" {
#   value       = try(module.vpn.0.cgw, null)
#   description = "Information about cgw vpn connection"
# }