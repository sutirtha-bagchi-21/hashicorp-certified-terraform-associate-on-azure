# Resource-2: Create Virtual Network
resource "azurerm_virtual_network" "myvnet1" {
  name = "myvnet1"
  location = azurerm_resource_group.RG-terraform.location
  resource_group_name = azurerm_resource_group.RG-terraform.name
  address_space = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
}
# Resource-3: Create Subnet
resource "azurerm_subnet" "subnet-1" {
  name = "subnet-1"
  resource_group_name = azurerm_resource_group.RG-terraform.name
  virtual_network_name = azurerm_virtual_network.myvnet1.name
  address_prefixes = [ "10.1.1.0/24" ]
}
# Resource-4: Create Public IP Address
resource "azurerm_public_ip" "terr-pip-1" {
  name                    = "terr-pip-1"
  location                = azurerm_resource_group.RG-terraform.location
  resource_group_name     = azurerm_resource_group.RG-terraform.name
  allocation_method       = "Static"
  idle_timeout_in_minutes = 30
}
# Resource-5: Create Network Interface
resource "azurerm_network_interface" "myvmnic1" {
  name                = "myvmnic1"
  location            = azurerm_resource_group.RG-terraform.location
  resource_group_name = azurerm_resource_group.RG-terraform.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.terr-pip-1.id
  }
}