resource "azurerm_traffic_manager_profile" "example_traffic_manager" {
  name                = "example-traffic-manager"
  resource_group_name = azurerm_resource_group.example.name
  traffic_routing_method = "Priority"
  dns_name = "shekerbekov.com"
}

resource "azurerm_traffic_manager_endpoint" "example_endpoint" {
  name                     = "example-endpoint"
  resource_group_name      = azurerm_resource_group.example.name
  profile_name             = azurerm_traffic_manager_profile.example_traffic_manager.name
  type                     = "azureEndpoints"
  target_resource_id       = azurerm_linux_virtual_machine_scale_set.example.id
  endpoint_status          = "Enabled"
  endpoint_location        = azurerm_resource_group.example.location
  priority                 = 1
  weight                   = 1
}
