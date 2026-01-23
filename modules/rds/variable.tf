#RDS Modules - Variables

variable "project_name" {
    description = "Name of the project - used for tagging resources"
    type = string

}

variable "environment" {
    description = "Environment name (dev, staging, prod)"
    type = string
}

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
variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage for RDS in GB"
  type        = number
  default     = 10
}

variable "engine_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}

variable "private_subnet_ids" {
    description = "List of private subnet IDs for RDS"
    type = list(string)
}
variable "db_security_group_id" {
    description = "Security Group ID for the RDS instance"
    type = string   
}
