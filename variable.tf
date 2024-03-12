variable "location" {
  description = "The location where resources will be created"
  type        = string
  default     = null
}

variable "tags" {
 description = "A map of the tags to use for the resources that are deployed"
 type       = map(string)
 default = {
   environment = "Azure_Team_Project"
 }
}
