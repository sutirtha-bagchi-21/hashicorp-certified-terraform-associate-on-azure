/*
# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = local.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  tags = local.common_tags
}

# Create Subnet
resource "azurerm_subnet" "mysubnet" {
  name                 = local.snet_name
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
*/
# Create Virtual Network and Subnets using Terraform Public Registry Module
module "avm-res-network-virtualnetwork" {
  source              = "Azure/avm-res-network-virtualnetwork/azurerm"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg.location
  name                = local.vnet_name
  resource_group_name = azurerm_resource_group.myrg.name
  subnets = {
    "subnet1" = {
      name             = "subnet1"
      address_prefixes = ["10.0.1.0/24"]
    }
    "subnet2" = {
      name              = "subnet2"
      address_prefixes  = ["10.0.2.0/24"]
      service_endpoints = ["Microsoft.Storage", "Microsoft.Sql"]
    }
    "subnet3" = {
      name              = "subnet3"
      address_prefixes  = ["10.0.3.0/24"]
      service_endpoints = ["Microsoft.AzureActiveDirectory"]
    }
  }
  tags = {
    environment = "terraform"
    costcenter  = "rg"
  }

  depends_on = [azurerm_resource_group.myrg]

}

module "network-security-group" {
  source  = "Azure/network-security-group/azurerm"
  version = "4.1.0"
  # insert the 1 required variable here
  resource_group_name = azurerm_resource_group.myrg.name
  security_group_name = "nsg-my-home-3389-22"
  #custom_rules =["myhomeaccess3389-22",100,"Inbound","Allow","Tcp","*",[]"3389","22"],"100.35.206.242","VirtualNetwork","test"]
  # rules                      = { "myhomeaccess3389" : [100, "Inbound", "Allow", "Tcp", "*", "3389", "allow3389"], "myhomeaccess22" : [200, "Inbound", "Allow", "Tcp", "*", "22", "allow22"] }
  predefined_rules = [
    {
      name     = "RDP"
      priority = 102
    },
    {
      name     = "HTTPS"
      priority = 104
    }
  ]
  custom_rules = [{ name = "myssh", priority = "101", direction = "Inbound", access = "Allow", protocol = "Tcp", source_port_range = "*", destination_port_range = "22", source_address_prefix = "100.35.206.242", destination_address_prefix = "VirtualNetwork", description = "myssh" }, { name = "http-80", priority = "103", direction = "Inbound", access = "Allow", protocol = "Tcp", source_port_range = "*", destination_port_range = "80", source_address_prefix = "100.35.206.242", destination_address_prefix = "VirtualNetwork", description = "http-80" }]

  source_address_prefix      = ["100.35.206.242"]
  destination_address_prefix = ["VirtualNetwork"]
  depends_on                 = [azurerm_resource_group.myrg, module.avm-res-network-virtualnetwork]
}

resource "azurerm_subnet_network_security_group_association" "subnet-nsg" {
  subnet_id                 = module.avm-res-network-virtualnetwork.subnets["subnet1"].resource_id
  network_security_group_id = module.network-security-group.network_security_group_id
  depends_on                = [azurerm_resource_group.myrg, module.avm-res-network-virtualnetwork, module.network-security-group]
}
# Create Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  name                = local.pip_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = "Static"
  domain_name_label   = "app1-${var.environment}-${random_string.myrandom.id}"
  tags                = local.common_tags
}

# Create Network Interface
resource "azurerm_network_interface" "myvmnic" {
  name                = local.nic_name
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name = "internal"
    #subnet_id                    = azurerm_subnet.mysubnet.id       
    subnet_id                     = module.avm-res-network-virtualnetwork.subnets["subnet1"].resource_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypublicip.id
  }
  tags = local.common_tags
}
