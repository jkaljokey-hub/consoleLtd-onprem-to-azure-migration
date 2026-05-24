variable "vm_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}
variable "admin_username" {}
variable "admin_password" {}
variable "vm_size" {
  description = "Size of the Windows VM"
  default     = "Standard_D2s_v3"
}
