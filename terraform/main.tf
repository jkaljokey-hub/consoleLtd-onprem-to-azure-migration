module "network" {
  source              = "./modules/network"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "vm" {
  source              = "./modules/vm"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "sql" {
  source              = "./modules/sql"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "storage" {
  source              = "./modules/storage"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "fileshare" {
  source              = "./modules/fileshare"
  storage_account_id  = module.storage.storage_account_id
}

module "monitor" {
  source              = "./modules/monitor"
  resource_group_name = var.resource_group_name
}
