variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "enviorment" {
  description = "the enviorment that the resource was created on"
  type=string
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

variable "admin_user" {
  type = string
  description = "User name to use as the admin account on the VMs that will be part of the VM scale set"
}

variable "sku" {
  type = string
  description = "the sku of scale set"
}

variable "admin_password" {
  type = string
   description = "password for admin account"
   sensitive=true 
 }

 variable "subnet_id"{
   description="the id of the public subnet"
 }

 variable "backendPoll_id"{
   description="the id of the Lb backend pool "
 }

 variable "vmss_ip"{
    description="Ip of vmss machines "
 }

#getting by module
variable "virtual_network_id" {
  description = "the id of the network"
}

variable "capacity" {
  description = "number of virtual machine"
  type=number
}

variable "defaultNumVm" {
  description = "default number of virtual machine"
  type=number
}

variable "minVm" {
  description = "minimum number of virtual machine"
  type=number
}


