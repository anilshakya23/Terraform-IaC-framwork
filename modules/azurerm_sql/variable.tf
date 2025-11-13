variable "sqls" {
  type = map(object({
    ids_name                     = string
    location                     = string
    resource_group_name          = string
    name                         = string
    admin_username               = string
    administrator_login_password = string
    tags                         = optional(map(string))
  }))
}
