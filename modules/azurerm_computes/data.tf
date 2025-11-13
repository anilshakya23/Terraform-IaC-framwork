data "azurerm_key_vault" "kevault" {
  for_each            = var.vms
  name                = each.value.kevault_name
  resource_group_name = "rg-anil"
}

data "azurerm_key_vault_secret" "username" {
  for_each     = var.vms
  name         = each.value.username
  key_vault_id = data.azurerm_key_vault.kevault[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each     = var.vms
  name         = each.value.password
  key_vault_id = data.azurerm_key_vault.kevault[each.key].id
}

data "azurerm_subnet" "subnet_data" {
  for_each             = var.vms
  name                 = each.value.name_subnet
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

