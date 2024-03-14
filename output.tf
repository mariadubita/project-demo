output vnet_id {
    value = azurerm_virtual_network.wordpress.id
}

output "application_public_address" {
  value = aws_route53_record.wordpressdb.name
}

output rg_id {
    value = azurerm_resource_group.example.id
}
output sql_id {
    value = azurerm_mysql_server.example.id
}
output ss_id {
    value = azurerm_linux_virtual_machine_scale_set.example.id
}