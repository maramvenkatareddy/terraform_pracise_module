resource "azurerm_resource_group" "group" {
    location = var.resgdetils.location
    name = var.resgdetils.name
}
resource "azurerm_virtual_network" "network" {
        name = var.vnet_name
        resource_group_name = var.resgdetils.name
        address_space = [var.address_vnet_space[0]]
        location = var.resgdetils.location

    depends_on = [
        azurerm_resource_group.group
    ]
}
resource "azurerm_subnet" "subnets" {
    name = var.subnet_names[0]
    resource_group_name = var.resgdetils.name
    virtual_network_name = var.vnet_name
    address_prefixes = [cidrsubnet(var.address_vnet_space[0], 8, 1)]

    depends_on = [
        azurerm_resource_group.group,
        azurerm_virtual_network.network
    ]
}