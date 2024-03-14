output vnet_id {
    value = azurerm_virtual_network.wordpress.id
}

output "application_public_address" {
  value = aws_route53_record.wordpressdb.name
}
