module "ResourceGroup" {
  source = "./modules/resourceGroup"
  base_name = var.enviorment
  location = var.location
   tags = "${merge(var.default_tags,tomap({"type"="resource"}))}"
}

/*
resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

#creating storage account 
resource "azurerm_storage_account" "storage" {
  name = "tfstate${random_string.resource_code.result}"
  resource_group_name = module.ResourceGroup.rg_name_out
  location=var.location
  tags                     = "${merge(var.default_tags, map("type", "resource"))}"
  account_tier             = "Standard"
   account_replication_type = "LRS"
   depends_on=[module.ResourceGroup.rg_name_out]
}

#creating container
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
  depends_on=[azurerm_storage_account.storage]
}
*/

module "VirtualNetwork"{
  source="./modules/network"
  enviorment = var.enviorment
  resource_group_name = module.ResourceGroup.rg_name_out
  location=var.location
   tags = "${merge(var.default_tags,tomap({"type"="network"}))}"
}


module PostgresDb{
  source="./modules/postgressSql"
  enviorment = var.enviorment
  resource_group_name = module.ResourceGroup.rg_name_out
  location=var.location
  virtual_network_id =module.VirtualNetwork.virtual_network_id
  delegated_subnet_id=module.VirtualNetwork.delegated_subnet_id 
  administrator_password=var.administrator_password
   tags = "${merge(var.default_tags,tomap({"type"="postgresDb"}))}"
}



module "LoadBalancer"{
  source="./modules/loadBalancer"
  enviorment = var.enviorment
  resource_group_name = module.ResourceGroup.rg_name_out
  location=var.location
  lbIp_id=module.VirtualNetwork.lbIp_id
   tags = "${merge(var.default_tags,tomap({"type"="loadBalancer"}))}"
}

module "ScaleSet"{
  source="./modules/scaleSet"
  enviorment = var.enviorment
  resource_group_name = module.ResourceGroup.rg_name_out
  location=var.location
  tags = "${merge(var.default_tags,tomap({"type"="vmss"}))}"
  sku=var.sku
  capacity            = "${var.capacity}"
  defaultNumVm="${var.defaultNumVm}"
  minVm="${var.minVm}"
  admin_user = var.admin_user
  admin_password = var.admin_password
  subnet_id = module.VirtualNetwork.subnet_id
  vmss_ip=module.VirtualNetwork.vmss_ip
  backendPoll_id =module.LoadBalancer.backendPool_id
  virtual_network_id=module.VirtualNetwork.virtual_network_id
}

module "ConfigVm"{
  source="./modules/appServer"
  enviorment = var.enviorment
  resource_group_name = module.ResourceGroup.rg_name_out
  location=var.location
  tags = "${merge(var.default_tags,tomap({"type"="vm"}))}"
  size=var.size
  network_interface_ids=module.VirtualNetwork.network_interface_ids
  admin_user = var.admin_user
  admin_password = var.admin_password
}





