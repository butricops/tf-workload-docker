## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.10.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_ec2_instaces"></a> [aws\_ec2\_instaces](#module\_aws\_ec2\_instaces) | github.com/butricops/tf-modules//tf-modules-ec2/aws_ec2_instaces | n/a |
| <a name="module_key_pair"></a> [key\_pair](#module\_key\_pair) | github.com/butricops/tf-modules//tf-modules-ec2/key_pair | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.alb_distribution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_lb.app_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.app_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.app_tg_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_secretsmanager_secret.private_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.private_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_security_group.lb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ebs_disks"></a> [ebs\_disks](#input\_ebs\_disks) | n/a | <pre>map(object({<br>    size        = number<br>    volume_type = string<br>  }))</pre> | `{}` | no |
| <a name="input_instances"></a> [instances](#input\_instances) | n/a | <pre>map(object({<br>    ami                         = optional(string)<br>    ebs_block_device            = optional(map(any))<br>    enable_eip                  = optional(bool)<br>    get_password_data           = optional(bool)<br>    instance_type               = optional(string)<br>    iam_instance_profile        = optional(string)<br>    key_name                    = optional(string)<br>    root_block_device_size      = optional(number)<br>    root_block_device_type      = optional(string)<br>    associate_public_ip_address = optional(bool)<br>    security_groups             = optional(list(any))<br>    subnet_id                   = optional(string)<br>    tags                        = optional(map(any))<br>    # vpc_security_group_ids      = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_keypair_name"></a> [keypair\_name](#input\_keypair\_name) | n/a | `string` | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to create security group | `string` | `null` | no |

## Outputs

No outputs.
