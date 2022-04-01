output "Password" {
  value = azurerm_linux_virtual_machine.myConfigvm.admin_password
  sensitive = true
}