resource "azurerm_storage_share" "fileshare" {
  name                 = "erpfiles"
  storage_account_name = var.storage_account_name
  quota                = 50
}
