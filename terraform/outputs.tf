output "vm_public_ip" {
  value = module.vm.public_ip
}

output "sql_server_name" {
  value = module.sql.sql_server_name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}
