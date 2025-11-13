variable "sqldatabase" {
  type = map(object({
    name                = string
    resource_group_name = string
    name_data           = string
    tags                = optional(map(string))
  }))
}
