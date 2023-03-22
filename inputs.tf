variable "resgdetils" {
    type = object({
        name = string
        location = string
    })
}
variable "vnet_name" {
    type = string
}
variable "address_vnet_space" {
        type = list(string)
}
variable "subnet_names" {
    type = list(string)
  
}