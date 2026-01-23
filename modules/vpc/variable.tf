#General Variables
variable "project_name" {
    description = "Name of the project - used for tagging resources"
    type = string
}

variable "environment" {
    description = "Environment name (dev, staging, prod)"
    type = string
   }
variable "region" {
    description = "AWS region to deploy ressources"
    type = string
  }

#VPC Variables
variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type = string
     }
#public Subnet
variable "public_subnet_cidr" {
    description = "CIDR block for the public subnet"
    type = string
}
#private Subnet
variable "private_subnet_cidr" {
    description = "CIDR block for the private subnet"
    type = list(string)
}

