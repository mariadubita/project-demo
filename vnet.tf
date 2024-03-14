# Create a virtual network within the resource group

resource "azurerm_virtual_network" "wordpress" {
 name               = "wordpress-vnet"
 address_space      = ["10.0.0.0/16"]
 location           = var.location
 resource_group_name = azurerm_resource_group.wordpress.name
 tags               = var.tags
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.wordpress.name
  virtual_network_name = azurerm_virtual_network.wordpress.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = azurerm_resource_group.wordpress.name
  virtual_network_name = azurerm_virtual_network.wordpress.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "subnet3" {
  name                 = "subnet3"
  resource_group_name  = azurerm_resource_group.wordpress.name
  virtual_network_name = azurerm_virtual_network.wordpress.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_public_ip" "wordpress" {
  name                = "wordpress-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.wordpress.name
  allocation_method   = "Static"
  # domain_name_label   = random_string.fqdn.result
  tags                = var.tags
}

resource "aws_route53_record" "wordpressdb" {
  zone_id = "Z0105457OY7WSEO93CX1"
  name    = "wordpress.shekerbekov.com"
  type    = "A"
  ttl     = 300
  records = [azurerm_public_ip.wordpress.ip_address]
}