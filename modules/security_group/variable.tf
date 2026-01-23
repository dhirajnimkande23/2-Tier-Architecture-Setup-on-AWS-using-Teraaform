variable "project_name" {
    description = "Name of the project - used for tagging resources"
    type = string
}

variable "environment" {
    description = "Environment name (dev, staging, prod)"
    type = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "web_sg_name" {
    description = "Name of the web security group"
    type = string
    
  
}