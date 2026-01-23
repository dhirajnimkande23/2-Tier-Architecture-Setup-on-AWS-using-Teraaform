#General Variables
variable "project_name" {
  description = "Name of the project - used for tagging resources"
  type        = string
  default     = "day22-rds-demo"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}
variable "region" {
  description = "AWS region to deploy ressources"
  type        = string
  default     = "us-east-1"
}

#VPC Variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}

# EC2 Variables
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

#RDS Variables
variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "webappdb"
}

variable "db_username" {
  description = "Database master username"
  type        = string
  default     = "admin"
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Allocated storage for RDS in GB"
  type        = number
  default     = 10
}

variable "db_engine_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}


#security Group Variables
variable "web_sg_name" {
  description = "Name of the web security group"
  type        = string
  default     = "$(var.project_name)-web-sg"

}