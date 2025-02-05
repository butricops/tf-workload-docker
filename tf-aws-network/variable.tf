variable "create_vpc" {
  type        = bool
  default     = true
  description = "(Optional) It indicates if the vpc will be created or not."
}

variable "vpc_cidr_block" {
  type        = string
  description = "(Optional) The cidr block of the desired VPC. However it will be required when the create_vpc is true"
}

variable "custom_subnets_cidrs" {
  type        = list(any)
  default     = null
  description = "(Optional) The user defined cidrs to be used on subnets."
}

variable "vpc_name" {
  type        = string
  default     = null
  description = "(Optional) The vpc name to identify this resource in aws console."
}

variable "enable_dns_support" {
  type        = bool
  default     = true
  description = "(Optional) A boolean flag to enable/disable DNS support in the VPC. Defaults true."
}

variable "enable_dns_hostname" {
  type        = bool
  default     = false
  description = "(Optional) A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
}
variable "aws_account_name" {
  type        = string
  description = "(Required) The aws account name where resources will be created."
}

variable "vpc_tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) A map of tags to assign to the resource."
}

variable "azs" {
  type        = string
  description = "(Optional) identifier if the AZs will be created dynamically or not. you should pass 'dynamic' as a value or a number of AZs you want to work."
  default     = "dynamic"

  validation {
    condition     = can(regex("^dynamic$|[1-9]", var.azs))
    error_message = "The azs value must be dynamic or number between 1 and 9."
  }
}

variable "private_mask" {
  type        = number
  description = "(Optional) The network private mask to calculate the subnet"
  default     = 0
}

variable "isolated_mask" {
  type        = number
  description = "(Optional) The network isolated mask to calculate the subnet"
  default     = 0
}

variable "public_mask" {
  type        = number
  description = "(Optional) The network public mask to calculate the subnet"
  default     = 0
}

variable "nat_gateway_deployment" {
  type        = string
  description = "(Optional) The number of nat gateway to be created"
  default     = "dynamic"

  validation {
    condition     = can(regex("^dynamic$|^fixed$", var.nat_gateway_deployment))
    error_message = "The azs value must be dynamic or fixed."
  }
}

variable "region" {
  type    = string
  default = "us-east-1"
}

# variable "role_arn" {
#   type = string
# }

variable "profile" {
  type        = string
}
