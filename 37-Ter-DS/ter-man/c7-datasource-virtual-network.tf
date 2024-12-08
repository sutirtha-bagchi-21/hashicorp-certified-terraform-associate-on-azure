# Datasources
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network
data "azurerm_virtual_network" "vnetds" {
  name                = azurerm_virtual_network.myvnet.name
  resource_group_name = data.azurerm_resource_group.RG-Networking.name
  #depends_on = [ azurerm_virtual_network.myvnet ]
}

## TEST DATASOURCES using OUTPUTS
# 1. Virtual Network Name from Datasource
output "ds_vnet_name" {
  value = data.azurerm_virtual_network.vnetds.name
}

# 2. Virtual Network ID from Datasource
output "ds_vnet_id" {
  value = data.azurerm_virtual_network.vnetds.id
}

# 3. Virtual Network address_space from Datasource
output "ds_vnet_address_space" {
  value = data.azurerm_virtual_network.vnetds.address_space
}

