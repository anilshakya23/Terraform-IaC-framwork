data "azurerm_mssql_server" "sql-data" {
  for_each            = var.sqldatabase
  name                = each.value.name_data
  resource_group_name = each.value.resource_group_name
}
