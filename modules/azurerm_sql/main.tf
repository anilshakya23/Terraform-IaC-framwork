resource "azurerm_user_assigned_identity" "ids" {
  for_each            = var.sqls
  name                = each.value.ids_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_mssql_server" "sql" {
  for_each                     = var.sqls
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.admin_username
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = azurerm_user_assigned_identity.ids[each.key].name
    object_id      = azurerm_user_assigned_identity.ids[each.key].principal_id
  }

  tags = each.value.tags
}




