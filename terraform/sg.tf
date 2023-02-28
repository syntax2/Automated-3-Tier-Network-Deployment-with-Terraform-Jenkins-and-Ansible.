module "public_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        ="public"
  description = "Security group foruser-service with custom ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_rules = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
}


module "private_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        ="private"
  description = "Security group foruser-service with custom ports open within VPC"
  vpc_id      = module.vpc.vpc_id
  ingress_cidr_blocks      = ["10.0.0.0/16"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]

  

  egress_rules = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
}


