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

variable "public_sub_name"{
    type = string
    description = "The name of the vnet"
    default="publicSubnet"
}

variable "private_sub_name"{
    type = string
    description = "The name of the vnet"
    default="privateSubnet"
}
