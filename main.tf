#RDS Database Projects
#Main Configuration -Root Module

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = var.region
}


#Secret Modules
module "secrets" {
  source = "./modules/secrets"

  project_name = var.project_name
  environment  = var.environment
  db_username  = var.db_username
}

#VPC modules
module "vpc" {
  source              = "./modules/vpc"
  project_name        = var.project_name
  environment         = var.environment
  region              = var.region
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

}

#Security Group Module
module "security_group" {
  source       = "./modules/security_group"
  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
  web_sg_name  = var.web_sg_name
}


#RDS Module

module "rds" {
  source = "./modules/rds"

  project_name         = var.project_name
  environment          = var.environment
  private_subnet_ids   = module.vpc.private_subnet_ids
  db_security_group_id = module.security_group.aws_security_group_db_id
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = module.secrets.db_password
  instance_class       = var.db_instance_class
  allocated_storage    = var.db_allocated_storage
  engine_version       = var.db_engine_version
}

# EC2 modules
module "ec2" {
  source = "./modules/ec2"

  project_name          = var.project_name
  environment           = var.environment
  instance_type         = var.instance_type
  public_subnet_id      = module.vpc.public_subnet_id
  web_security_group_id = module.security_group.aws_security_group_web_sg_id
  db_host               = module.rds.db_endpoint
  db_username           = var.db_username
  db_password           = module.secrets.db_password
  db_name               = var.db_name
}


