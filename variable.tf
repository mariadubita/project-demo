variable "location" {
  description = "The location where resources will be created"
  type        = string
  default     = "eastus"
}


variable "tags" {
 description = "A map of the tags to use for the resources that are deployed"
 type       = map(string)
 default = {
   environment = "Azure_Team_Project"
 }
}


variable "application_port" {
  description = "The port that you want to expose to the external load balancer"
  default     = 80
}


variable "admin_username" {
  description = "User name to use as the admin account on the VMs that will be part of the VM Scale Set"
  default     = "wordpress"
}


variable "admin_password" {
  description = "Default password for admin account"
  default     = "26F4QXHVYbBjC$WH2HAc"
}


variable "aws_access_key" {
  default = "AKIA5FTY7HJYQ7AVFFPY"
}

variable "aws_secret_key" {
  default = "sN0p2gnf/S3EUOJiNEAtuoTxI/Re/XNLoEtd+Zgc"
}

variable "sec_group" {
  description = "Enter Security Group name"
  default     = "wordpress_sec_group"
}

variable "database_admin_login" {
  default     = "wordpress"
}

variable "database_admin_password" {
  description = "Default password for database"
  default     = "26F4QXHVYbBjC$WH2HAc"
}

variable "dbname"{
  default = "db-wordpress-azureteam"
}
