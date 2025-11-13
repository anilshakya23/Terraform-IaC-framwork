variable "rgs" {
  type = map(object({
    rg_name  = string
    location = string
    tags     = optional(map(string))

  }))
}

variable "networks" {
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = optional(list(string))
    subnets = map(object({
      subnet_name      = string
      address_prefixes = list(string)
    }))
    tags = optional(map(string))
  }))

}


variable "pips" {
  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = optional(map(string))
  }))

}
variable "vms" {
  type = map(object({
    nic_name               = string
    location               = string
    resource_group_name    = string
    vm_name                = string
    size                   = string
    admin_username         = string
    admin_password         = string
    source_image_reference = map(string)
    os_disk                = map(string)
    virtual_network_name   = string
    name_subnet            = string
    kevault_name           = string
    username               = string
    password               = string
    tags                   = optional(map(string))
  }))
}

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

variable "sqldatabase" {
  type = map(object({
    name                = string
    resource_group_name = string
    name_data           = string
    tags                = optional(map(string))
  }))
}

variable "keyvoults" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))

}

variable "bastions" {
  type = map(object({
    resource_group_name  = string
    virtual_network_name = string
    name                 = string
    location             = string
    name_pip             = string
  }))

}

