#getting this varaibles from another module
variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "location" {
    type = string
    description = "The location for the deployment"
}

variable "enviorment" {
  description = "the enviorment that the resource was created on"
  type=string
}

variable "tags" {
  description = "The tags to associate the resource we are creating"
  type        = map
  default     = {}
}


variable "network_interface_ids"{
    description="the id of the network interface"
}

variable "admin_user" {
  type = string
  description = "User name to use as the admin account on the VMs that will be part of the VM scale set"
}

variable "admin_password" {
  type = string
   description = "password for admin account"
   sensitive=true 
 }

 variable "size" {
  type = string
  description = "size of virtual machine"
}
