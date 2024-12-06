# 1. Output Values - Resource Group
output "resource_group_id" {
  description = "Resource Group ID"
  # Atrribute Reference
  value = azurerm_resource_group.myrg.id
}
output "resource_group_name" {
  description = "Resource Group name"
  # Argument Reference
  value = azurerm_resource_group.myrg.name
}

# 2. Output Values - Virtual Network
/*
output "virtual_network_name" {
  description = "Virutal Network Name"
  value = azurerm_virtual_network.myvnet[*].name   
  #sensitive = true
}
*/

# Output - For Loop One Input and List Output with VNET Name 
output "vnet_name" {
  description = "List Output with VNET Name"
  value = [for vnet in azurerm_virtual_network.myvnet: vnet.name]
}

# Output - For Loop Two Inputs, List Output which is Iterator i (var.environment)
output "vnet_name_list_2_attr" {
  description = "vnet_name_list_2_attr"
  value = [for env, vnet in azurerm_virtual_network.myvnet: env]
}

# Output - For Loop One Input and Map Output with VNET ID and VNET Name
output "vnet_name_list_map" {
  description = "Map Output with VNET ID and VNET Name"
  value = {for vnet in azurerm_virtual_network.myvnet: vnet.name => vnet.location}
}

# Output - For Loop Two Inputs and Map Output with Iterator env and VNET Name
output "vnet_name_list_map_2_val" {
  description = "Map Output with VNET ID and VNET Name with env"
  value = {for env, vnet in azurerm_virtual_network.myvnet: env => vnet.name}
}
# Terraform keys() function: keys takes a map and returns a list containing the keys from that map.
output "vnet_name_list_map_2_keys" {
  description = "Map Output with VNET ID and VNET Name with env"
  value = keys({for env, vnet in azurerm_virtual_network.myvnet: env => vnet.name})
}
# Terraform values() function: values takes a map and returns a list containing the values of the elements in that map.
output "vnet_name_list_map_2_keys_values" {
  description = "Map Output with VNET ID and VNET Name with env"
  value = values({for env, vnet in azurerm_virtual_network.myvnet: env => vnet.name})
}