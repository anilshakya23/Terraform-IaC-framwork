module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "network" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_network"
  networks   = var.networks
}

module "pip" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_pip"
  pips       = var.pips
}

module "vm" {
  depends_on = [module.rg, module.network, module.pip]
  source     = "../../modules/azurerm_computes"
  vms        = var.vms

}

module "sql" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_sql"
  sqls       = var.sqls
}

module "sqldatabase" {
  depends_on  = [var.rgs, module.sql]
  source      = "../../modules/azurerm_database"
  sqldatabase = var.sqldatabase
}

module "bastion" {
  depends_on = [module.rg, module.pip, module.network]
  source     = "../../modules/azurerm_bation"
  bastions   = var.bastions
}





