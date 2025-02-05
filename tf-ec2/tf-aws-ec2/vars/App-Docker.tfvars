vpc_id       = "vpc-06e1ba0619b6b3794"
profile      = "butrico-devops"
region       = "us-east-1"
keypair_name = "kp-cloud"
instances = {
  win1 = {
    ami                         = "ami-0c614dee691cbbf37"
    instance_type               = "t2.micro"
    subnet_id                   = "subnet-08620e6cbacfc4d7b"
    key_name                    = "kp-cloud"
    get_password_data           = false
    enable_eip                  = false
    associate_public_ip_address = false
    root_block_device_size      = 30
    root_block_device_type      = "gp2"
    ebs_block_device = {
      "/dev/sdb" = {
        size        = 30,
        volume_type = "gp2"
      }
    }
    security_groups = [
      {
        description = "SSH"
        from_port   = "22"
        to_port     = "22"
        protocol    = "TCP"
        cidr_blocks = [
          "10.101.128.0/19"
        ]
      },
      {
        description = "Cloud Accouts AWS"
        from_port   = "0"
        to_port     = "0"
        protocol    = "-1"
        cidr_blocks = [
          "10.100.0.0/16", "10.101.0.0/16", "10.102.0.0/16", "10.103.0.0/16", "10.104.0.0/16", "10.105.0.0/16", "10.106.0.0/16", "10.107.0.0/16"
        ]
      }
    ],
    tags = {
      Name    = "App-Docker"
      ENV     = "PRD"
      Projeto = "GitOps"
    }
  }
}
