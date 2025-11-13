resource "azurerm_mssql_database" "sql-database" {
  for_each     = var.sqldatabase
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.sql-data[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = each.value.tags
}
