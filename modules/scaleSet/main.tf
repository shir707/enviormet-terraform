resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                            = "${var.enviorment}-vmss"
  resource_group_name      = var.resource_group_name
  location=var.location
  tags                = "${var.tags}"
  sku                             = "${var.sku}"
  instances                       = "${var.capacity}"
  admin_username                  = var.admin_user
  admin_password                  = var.admin_password
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  network_interface {
    name    = "example"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id =var.subnet_id
      load_balancer_backend_address_pool_ids =[var.backendPoll_id]

      public_ip_address {
        name                = "first"
        public_ip_prefix_id =var.vmss_ip
      }
    }
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  # Since these can change via auto-scaling outside of Terraform,
  # let's ignore any changes to the number of instances
  lifecycle {
    ignore_changes = ["instances"]
  }
   depends_on=[
       var.virtual_network_id
    ]
}

resource "azurerm_monitor_autoscale_setting" "main" {
  name                = "autoscale-config"
  resource_group_name      = var.resource_group_name
  location=var.location
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.vmss.id

  profile {
    name = "AutoScale"

    capacity {
      default = "${var.defaultNumVm}"
      minimum = "${var.minVm}"
      maximum = 5
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}
