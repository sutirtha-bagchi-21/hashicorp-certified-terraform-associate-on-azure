# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "weblinuxvm" {
  name                  = var.vm_name_webservers
  computer_name         = var.web_computer_name
  resource_group_name   = azurerm_resource_group.myrg.name
  location              = azurerm_resource_group.myrg.location
  size                  = "Standard_D2as_v4"
  admin_username        = "azureuser"
  admin_password        = "AhtritusMS11@"
  network_interface_ids = [azurerm_network_interface.webvmnic.id]
  os_disk {
    name                 = "osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  disable_password_authentication = false
  capacity_reservation_group_id = local.selected_crg_id
  zone = "1"
}

# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "applinuxvm" {
  name                  = var.vm_name_appservers
  computer_name         = var.app_computer_name
  resource_group_name   = azurerm_resource_group.myrg.name
  location              = azurerm_resource_group.myrg.location
  size                  = "Standard_D4as_v4"
  admin_username        = "azureuser"
  admin_password        = "AhtritusMS11@"
  network_interface_ids = [azurerm_network_interface.appvmnic.id]
  os_disk {
    name                 = "osdisk-app"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  disable_password_authentication = false
  capacity_reservation_group_id = local.map_crg_ids_by_name.crg-app
  zone = "1"
}

