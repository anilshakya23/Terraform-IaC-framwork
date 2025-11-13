resource "azurerm_subnet" "bastion_sunet" {
  for_each             = var.bastions
  name                 = "AzureBastionSubnet"
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bastions
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_sunet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip-data[each.key].id
  }
}




