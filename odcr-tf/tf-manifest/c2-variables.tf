# Input Variables

# 1. Business Unit Name
variable "business_unit" {
  description = "Business Unit Name"
  type        = string
  default     = "hr"
}
# 2. Environment Name
variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "dev"
}
# 3. Resource Group Name
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "myrg-odcr"
}
# 4. Resource Group Location
variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
  default     = "Central US"
}
# 5. Virtual Network Name
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "odcr-vnet"
}

# odcr group name - webserver
variable "odcr_group_name_web" {
  description = "ODCR Group Name"
  type        = string
  default     = "cr-grp-cus-web"
}
# odcr group name - appserver
variable "odcr_group_name_app" {
  description = "ODCR Group Name"
  type        = string
  default     = "cr-grp-cus-app"
}

# odcr group name - appserver
variable "odcr_reservation_name_web_da2s_v4" {
  description = "ODCR reservation Name web servers"
  type        = string
  default     = "cr-cus-web-da2s-v4"
}

# odcr group name - appserver
variable "odcr_reservation_name_app_da4s_v4" {
  description = "ODCR reservation Name for app server"
  type        = string
  default     = "cr-cus-app-da2s-v4"
}
variable "vm_name_webservers" {
  description = "Web VM server name"
  type        = string
  default     = "web-vm-1"
}
variable "vm_name_appservers" {
  description = "App VM server name"
  type        = string
  default     = "app-vm-1"
}
variable "web_computer_name" {
  description = "Web VM computer name"
  type        = string
  default     = "web-linux-vm1"
}
variable "app_computer_name" {
  description = "App VM computer name"
  type        = string
  default     = "app-linux-vm1"
}


# YOU CAN ADD LIKE THIS MANY MORE argument values from each resource
# 6. Subnet Name
# 7. Public IP Name
# 8. Network Interface Name
# 9. Virtual Machine Name
# 10. VM OS Disk Name
# 11. .....
# 12. ....

