# Define Azure resource group
resource "azurerm_resource_group" "wordpress" {
  name     = "wordpress-resources"
  location = var.location
}
# Declare the public IP address resource
resource "azurerm_public_ip" "wordpress" {
  name                = "wordpress-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.wordpress.name
  allocation_method   = "Dynamic"
}
# Define Azure Load Balancer
resource "azurerm_lb" "wordpress" {
  name                = "wordpress-lb"
  location            = var.location
  resource_group_name = azurerm_resource_group.wordpress.name
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.wordpress.id
  }
  tags = var.tags
}
# Define backend address pool for the Load Balancer
resource "azurerm_lb_backend_address_pool" "bpepool" {
  loadbalancer_id = azurerm_lb.wordpress.id
  name            = "BackEndAddressPool"
}
# Define probe for the Load Balancer
resource "azurerm_lb_probe" "wordpress" {
  loadbalancer_id = azurerm_lb.wordpress.id
  name            = "ssh-running-probe"
  port            = var.application_port
}
# Define rule for the Load Balancer
resource "azurerm_lb_rule" "lbnatrule" {
  loadbalancer_id                = azurerm_lb.wordpress.id
  name                           = "http"
  protocol                       = "Tcp"
  frontend_port                  = var.application_port
  backend_port                   = var.application_port
  backend_address_pool_id        = azurerm_lb_backend_address_pool.bpepool.id
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.wordpress.id
  resource_group_name = azurerm_resource_group.wordpress.name
}