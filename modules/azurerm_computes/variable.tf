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

