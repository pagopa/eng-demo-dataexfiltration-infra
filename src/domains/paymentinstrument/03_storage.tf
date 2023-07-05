resource "azurerm_resource_group" "storage_pi_rg" {
  name     = "${local.project}-storage-rg"
  location = var.location
  tags     = var.tags
}


module "pi_storage_snet" {
  source               = "git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet?ref=v4.3.1"
  name                 = "${local.project}-storage-snet"
  address_prefixes     = var.cidr_subnet_storage_pi
  resource_group_name  = local.vnet_resource_group_name
  virtual_network_name = local.vnet_data_name

  private_link_service_network_policies_enabled = true
  private_endpoint_network_policies_enabled     = true

  service_endpoints = [
    "Microsoft.Storage",
  ]
}

resource "azurerm_private_endpoint" "storage_private_endpoint" {

  name                = "${local.project}-storage-private-endpoint"
  location            = var.location
  resource_group_name = azurerm_resource_group.storage_pi_rg.name
  subnet_id           = module.pi_storage_snet.id

  private_dns_zone_group {
    name                 = "${local.project}-storage-private-dns-zone-group"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.storage.id]
  }

  private_service_connection {
    name                           = "${local.project}-storage-private-service-connection"
    private_connection_resource_id = module.pi_storage.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  tags = var.tags
}

module "pi_storage" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//storage_account?ref=v6.1.0"

  name                            = replace("${local.project}-sa", "-", "")
  account_kind                    = var.pi_storage_params.kind
  account_tier                    = var.pi_storage_params.tier
  account_replication_type        = var.pi_storage_params.account_replication_type
  access_tier                     = "Hot"
  blob_versioning_enabled         = true
  resource_group_name             = azurerm_resource_group.storage_pi_rg.name
  location                        = var.location
  advanced_threat_protection      = var.pi_storage_params.advanced_threat_protection
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = false
  blob_delete_retention_days      = var.pi_storage_params.retention_days

  tags = var.tags
}

