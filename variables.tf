variable "enviorment" {
  description = "the enviorment that the resource was created on"
  type=string
}

variable "default_tags" {
  description = ""
  type        = map
  default     = {}
}


variable "location" {
    type = string
    description = "The location for the deplyment"
}

variable "admin_user" {
  type = string
  description = "User name to use as the admin account on the VMs that will be part of the VM scale set"
  default="azureuser"
}


variable "admin_password" {
  type = string
   description = "password for admin account"
   sensitive=true 
 }

 variable "administrator_password" {
  type = string
   description = "password for admin postgress account"
   sensitive=true 
 }
 
#scale set
 variable "capacity" {
  description = "number of virtual machine in scale set"
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

variable "sku" {
  type = string
  description = "the sku of scale set"
}

#virtual machine
 variable "size" {
  type = string
  description = "size of virtual machine"
}
