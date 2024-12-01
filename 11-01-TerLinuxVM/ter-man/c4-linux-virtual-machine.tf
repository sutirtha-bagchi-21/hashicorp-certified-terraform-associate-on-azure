resource "azurerm_linux_virtual_machine" "my-ter-linux-vm-1" {
  name = "my-ter-linux-vm-1"
  resource_group_name = azurerm_resource_group.RG-terraform.name
  location = azurerm_resource_group.RG-terraform.location
  size = "Standard_D2as_v4"
  admin_username = "azureuser"
  network_interface_ids = [azurerm_network_interface.myvmnic1.id]

    admin_ssh_key {
        username   = "azureuser"
        public_key = file("${path.module}/ssh-keys/terraform-azure-ssh.pub")
    }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 64
    name = "myosdisk1"
  }

    source_image_reference {
        publisher = "RedHat"
        offer     = "RHEL"
        sku       = "86-gen2"
        version   = "latest"
    }

    custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}