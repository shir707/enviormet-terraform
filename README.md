## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.65 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ConfigVm"></a> [ConfigVm](#module\_ConfigVm) | ./modules/appServer | n/a |
| <a name="module_LoadBalancer"></a> [LoadBalancer](#module\_LoadBalancer) | ./modules/loadBalancer | n/a |
| <a name="module_PostgresDb"></a> [PostgresDb](#module\_PostgresDb) | ./modules/postgressSql | n/a |
| <a name="module_ResourceGroup"></a> [ResourceGroup](#module\_ResourceGroup) | ./modules/resourceGroup | n/a |
| <a name="module_ScaleSet"></a> [ScaleSet](#module\_ScaleSet) | ./modules/scaleSet | n/a |
| <a name="module_VirtualNetwork"></a> [VirtualNetwork](#module\_VirtualNetwork) | ./modules/network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | password for admin account | `string` | n/a | yes |
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | User name to use as the admin account on the VMs that will be part of the VM scale set | `string` | `"azureuser"` | no |
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | password for admin postgress account | `string` | n/a | yes |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | number of virtual machine in scale set | `number` | n/a | yes |
| <a name="input_defaultNumVm"></a> [defaultNumVm](#input\_defaultNumVm) | default number of virtual machine | `number` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | n/a | `map` | `{}` | no |
| <a name="input_enviorment"></a> [enviorment](#input\_enviorment) | the enviorment that the resource was created on | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location for the deplyment | `string` | n/a | yes |
| <a name="input_minVm"></a> [minVm](#input\_minVm) | minimum number of virtual machine | `number` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | size of virtual machine | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | the sku of scale set | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Password"></a> [Password](#output\_Password) | n/a |
| <a name="output_RgName"></a> [RgName](#output\_RgName) | n/a |
| <a name="output_confMachine_ip"></a> [confMachine\_ip](#output\_confMachine\_ip) | n/a |
| <a name="output_lb_ip"></a> [lb\_ip](#output\_lb\_ip) | n/a |
