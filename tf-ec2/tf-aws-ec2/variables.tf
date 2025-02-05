variable "instances" {
  type = map(object({
    ami                         = optional(string)
    ebs_block_device            = optional(map(any))
    enable_eip                  = optional(bool)
    get_password_data           = optional(bool)
    instance_type               = optional(string)
    iam_instance_profile        = optional(string)
    key_name                    = optional(string)
    root_block_device_size      = optional(number)
    root_block_device_type      = optional(string)
    associate_public_ip_address = optional(bool)
    security_groups             = optional(list(any))
    subnet_id                   = optional(string)
    tags                        = optional(map(any))
    # vpc_security_group_ids      = optional(list(string))
  }))
}

variable "ebs_disks" {
  type = map(object({
    size        = number
    volume_type = string
  }))
  default = {}
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "VPC ID to create security group"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "keypair_name" {
  type = string
}

# variable "role_arn" {
#   type = string
# }

variable "profile" {
  type = string
}
