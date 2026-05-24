resource "azurerm_mssql_server" "sql" {
  name                         = "erp-sql-server"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladminuser"
  administrator_login_password = "StrongPassword123!"
}

resource "azurerm_mssql_database" "db" {
  name      = "erpdb"
  server_id = azurerm_mssql_server.sql.id
  sku_name  = "Basic"
}
