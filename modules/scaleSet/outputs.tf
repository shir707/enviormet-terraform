output "Password" {
  value = azurerm_linux_virtual_machine_scale_set.vmss.admin_password
  sensitive = true
}