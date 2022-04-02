output "RgName" {
  value = module.ResourceGroup.rg_name_out
}


output "lb_ip"{
  value=module.VirtualNetwork.lb_ip
}

output "confMachine_ip"{
  value=module.VirtualNetwork.public_ip
}


output "Password" {
  value = module.ScaleSet.Password
  sensitive=true
}

output "Password_vm" {
  value = module.ConfigVm.Password
  sensitive=true
}