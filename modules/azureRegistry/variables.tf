variable "resource_group_name" {
	type = string
  	description = "RG name in Azure"
    default="rg-acr"
}

variable "acr_name" {
	type = string
  	description = "ACR name in Azure"
    default="shirRegistry"
}

variable "location" {
	type = string
  	description = "Resources location in Azure"
    default="East US"
}
