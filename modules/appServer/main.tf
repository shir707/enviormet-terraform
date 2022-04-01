
# Create virtual machine
resource "azurerm_linux_virtual_machine" "myConfigvm" {
  name                  = "${var.enviorment}_vm"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  tags                = "${var.tags}"
  network_interface_ids = [var.network_interface_ids]
  size                  = "${var.size}"
  depends_on = [var.network_interface_ids]

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = var.admin_user
  disable_password_authentication = false
  admin_password                  = var.admin_password
}
