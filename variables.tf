
# General Variables

variable "region" {
  description = "Default region for provider"
  type        = string
  default     = "ca-central-1"
}

variable "app_name" {
  description = "Name of the web application"
  type        = string
  default     = "web-app"
}

variable "environment_name" {
  description = "Deployment environment (dev/staging/production)"
  type        = string
  default     = "dev"
}


# RDS Variables

variable "db_name" {
  description = "Name of DB"
  type        = string
  default     = "RCM"
}

variable "db_user" {
  description = "Username for DB"
  type        = string
  default     = "postgres"
}

variable "db_pass" {
  description = "Password for DB"
  type        = string
  sensitive   = true
  default     = "postgres"
}


# EC2 Variables

variable "ami" {
  description = "Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2022-06-09"
  type        = string
  default     = "ami-0b6937ac543fe96d7" # Ubuntu 22.04 LTS // ca-central-1
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}