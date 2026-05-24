resource "azurerm_mssql_database" "this" {
  name                = var.name
  server_id           = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Sql/servers/${var.server_name}"
  sku_name            = "GP_S_Gen5_2"
}

