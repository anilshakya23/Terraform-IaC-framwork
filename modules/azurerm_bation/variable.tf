variable "bastions" {
  type = map(object({
    resource_group_name  = string
    virtual_network_name = string
    name                 = string
    location             = string
    name_pip             = string
  }))

}