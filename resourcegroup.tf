resource "azurerm_resource_group" "wordpress" {
 name   = "wordpressResourceGroup"
 location = var.location
 tags   = var.tags
}