resource "azurerm_resource_group" "rg_vnet" {
  name     = format("%s-vnet-rg", local.project)
  location = var.location

  tags = var.tags
}

module "vnet" {
  source              = "git::https://github.com/pagopa/terraform-azurerm-v3.git//virtual_network?ref=v6.2.2"
  name                = format("%s-vnet", local.project)
  location            = azurerm_resource_group.rg_vnet.location
  resource_group_name = azurerm_resource_group.rg_vnet.name
  address_space       = var.cidr_vnet

  tags = var.tags
}

module "private_endpoint_snet" {
  source                                        = "git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet?ref=v6.2.2"
  name                                          = format("%s-private-endpoint-snet", local.project)
  address_prefixes                              = var.cidr_private_endpoint_subnet
  resource_group_name                           = azurerm_resource_group.rg_vnet.name
  virtual_network_name                          = module.vnet.name
  private_link_service_network_policies_enabled = true
  private_endpoint_network_policies_enabled     = true
}

# DNS internal: internal.dev.XXXX.pagopa.it

resource "azurerm_private_dns_zone" "internal_pagopa_it" {
  name                = "${var.dns_zone_internal_prefix}.${var.external_domain}"
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "internal_pagopa_it_vnet" {
  name                  = module.vnet.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.internal_pagopa_it.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false

  tags = var.tags
}

# DNS blob storage: privatelink.blob.core.windows.net

resource "azurerm_private_dns_zone" "privatelink_blob_core_windows_net" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_blob_core_windows_net_vnet" {
  name                  = module.vnet.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_blob_core_windows_net.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false

  tags = var.tags
}

# DNS Cosmos MongoDB: privatelink.mongo.cosmos.azure.com

resource "azurerm_private_dns_zone" "privatelink_mongo_cosmos_azure_com" {

  name                = "privatelink.mongo.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_mongo_cosmos_azure_com_vnet" {
  name                  = module.vnet.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_mongo_cosmos_azure_com.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false

  tags = var.tags
}

# DNS Key vault: privatelink.vaultcore.azure.net

resource "azurerm_private_dns_zone" "privatelink_vaultcore_azure_net" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = azurerm_resource_group.rg_vnet.name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_keyvault_azure_com_vnet" {
  name                  = module.vnet.name
  resource_group_name   = azurerm_resource_group.rg_vnet.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_vaultcore_azure_net.name
  virtual_network_id    = module.vnet.id
  registration_enabled  = false

  tags = var.tags
}

module "route_table_aks" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//route_table?ref=v6.2.2"

  name                          = format("%s-all2firewall-rt", local.project)
  location                      = azurerm_resource_group.rg_vnet.location
  resource_group_name           = azurerm_resource_group.rg_vnet.name
  disable_bgp_route_propagation = false

  subnet_ids = []

  routes = [
    {
      # dev aks nodo oncloud
      name                   = "all-route-to-firewall-subnet"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.1.240.4"
    },
  ]

  tags = var.tags
}
