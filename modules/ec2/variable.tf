variable "project_name" {
    description = "Name of the project - used for tagging resources"
    type = string
}

variable "environment" {
    description = "Environment name (dev, staging, prod)"
    type = string
}

variable "instance_type" {
        description = "EC2 Instance Type"
        type = string
}

variable "public_subnet_id" {
    description = "Public Subnet ID where EC2 will be launched"
    type = string
}
variable "web_security_group_id" {
    description = "Security Group ID for the web server"
    type = string   
}

variable "db_host" {
  description = "Database host endpoint"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
}