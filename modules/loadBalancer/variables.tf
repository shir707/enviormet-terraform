variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "location" {
    type = string
    description = "The location for the deployment"
}

variable "tags" {
  description = "The tags to associate the resource we are creating"
  type        = map
  default     = {}
}

variable "enviorment" {
  description = "the enviorment that the resource was created on"
  type=string
}

variable "lbIp_id"{
    description="the id of the public ip(send by network)"
}

variable "application_port" {
   description = "Port that you want to expose to the external load balancer"
   default     = 8080
}