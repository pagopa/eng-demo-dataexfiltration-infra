data "azurerm_virtual_network" "vnet_data" {
  name                = local.vnet_data_name
  resource_group_name = local.vnet_resource_group_name
}

data "azurerm_virtual_network" "vnet_app" {
  name                = local.vnet_application_name
  resource_group_name = local.vnet_resource_group_name
}


data "azurerm_private_dns_zone" "internal" {
  name                = local.internal_dns_zone_name
  resource_group_name = local.internal_dns_zone_resource_group_name
}

resource "azurerm_private_dns_a_record" "ingress" {
  name                = local.ingress_hostname
  zone_name           = data.azurerm_private_dns_zone.internal.name
  resource_group_name = local.internal_dns_zone_resource_group_name
  ttl                 = 3600
  records             = [var.ingress_load_balancer_ip]
}

data "azurerm_subnet" "aks_subnet" {
  name                 = local.aks_subnet_name
  virtual_network_name = local.vnet_application_name
  resource_group_name  = local.vnet_resource_group_name
}

data "azurerm_private_dns_zone" "cosmos" {
  name                = local.cosmos_dns_zone_name
  resource_group_name = local.cosmos_dns_zone_resource_group_name
}


data "azurerm_private_dns_zone" "storage" {
  name                = local.storage_blob_dns_zone_name
  resource_group_name = local.storage_dns_zone_resource_group_name
}

data "azurerm_private_dns_zone" "keyvault" {
  name                = local.keyvault_dns_zone_name
  resource_group_name = local.keyvault_dns_zone_resource_group_name
}