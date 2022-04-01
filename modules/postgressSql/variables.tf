#getting this varaibles from another module
variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "enviorment" {
  description = "the enviorment that the resource was created on"
  type=string
}

#getting by module
variable "virtual_network_id" {
  description = "the id of the network"
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


#getting by module
variable "delegated_subnet_id" {
  description = "the id of the private subnet"
}

variable "administrator_login" {
  type = string
   description = "User name to use as the admin account on the VMs that will be part of the VM scale set"
   default     = "postgres"
}

variable "administrator_password" {
  type = string
   description = "password for admin postgress account"
   sensitive=true 
 }