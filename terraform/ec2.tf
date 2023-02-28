module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "bastion"


  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.nano"
  key_name                    = "linux"
  monitoring                  = true
  vpc_security_group_ids      = [module.public_sg.security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "bastion"
  }
}



module "instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "jenkins"


  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  key_name                    = "linux"
  monitoring                  = true
  vpc_security_group_ids      = [module.private_sg.security_group_id]
  subnet_id                   = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "jenkins"
  }
}


module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "app"


  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.nano"
  key_name                    = "linux"
  monitoring                  = true
  vpc_security_group_ids      = [module.private_sg.security_group_id]
  subnet_id                   = module.vpc.private_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "app"
  }
}

