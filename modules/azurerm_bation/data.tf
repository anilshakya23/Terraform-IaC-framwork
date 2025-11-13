data "azurerm_public_ip" "pip-data" {
  for_each            = var.bastions
  name                = each.value.name_pip
  resource_group_name = each.value.resource_group_name
}