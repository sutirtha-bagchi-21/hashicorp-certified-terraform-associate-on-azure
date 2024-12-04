# Input Variables
# 1. Business Unit Name
variable "business_unit" {
  type = string
  default = "RG"
}
# 2. Environment Name
variable "environment" {
  type = string
  default = "terraform"
}
# 3. Resource Group Name
variable "resource_group_name" {
  type = string
  default = "test"
}
# 4. Resource Group Location
variable "resource_group_location" {
  type = string
  default = "eastus"
}
# 5. Virtual Network Name
variable "virtual_network_name" {
  type = string
  default = "myvnet"
}
# YOU CAN ADD LIKE THIS MANY MORE argument values from each resource
# 6. Subnet Name
variable "submet_name" {
  type = string
  description = "subnet name"
}
# 7. Public IP Name
# 8. Network Interface Name
# 9. Virtual Machine Name
# 10. VM OS Disk Name
# 11. .....
# 12. ....

