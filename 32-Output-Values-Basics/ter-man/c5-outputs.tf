# 1. Output Values for Resource Group Resource
output "resource_group_id" {
  description = "Resource Group ID"
  value       = azurerm_resource_group.RG-terraform-myrg.id
}

output "resource_group_name" {
  description = "Resource Group Name"
  value       = azurerm_resource_group.RG-terraform-myrg.name
}

output "resource_group_location" {
  description = "Resource Group Location"
  value       = azurerm_resource_group.RG-terraform-myrg.location
}

# 2. Output Values for Virtual Network Resource

output "vnet_name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.myvnet.name
}
output "vnet_location" {
  description = "Virtual Network Location"
  value       = azurerm_virtual_network.myvnet.location
}