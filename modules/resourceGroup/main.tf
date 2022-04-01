resource "azurerm_resource_group" "resource_group" {
  name     = "${var.base_name}_rg"
  location = var.location
  tags                = "${var.tags}"
}