resource "azurerm_private_dns_zone" "dns_zone" {
  name                = "dns.postgres.database.azure.com"
  resource_group_name      = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "virtual_network_link" {
  name                  = "VnetZone.com"
  private_dns_zone_name =azurerm_private_dns_zone.dns_zone.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name      = var.resource_group_name
   depends_on = [
     azurerm_private_dns_zone.dns_zone,
     var.virtual_network_id
  ]
}

resource "azurerm_postgresql_flexible_server" "dbServer" {
  name                   = "psqlflexibledb-${var.enviorment}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  tags                = "${var.tags}"
  version                = "12"
  delegated_subnet_id    = var.delegated_subnet_id 
  private_dns_zone_id    = azurerm_private_dns_zone.dns_zone.id
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  zone                   = "1"

  storage_mb = 32768

  sku_name   =  "B_Standard_B1ms"
  depends_on = [azurerm_private_dns_zone_virtual_network_link.virtual_network_link,var.delegated_subnet_id ]

}

##disabling ssl
resource "azurerm_postgresql_flexible_server_configuration" "disable_ssl" {
  name="require_secure_transport"
  server_id=azurerm_postgresql_flexible_server.dbServer.id
  value="off"
}


