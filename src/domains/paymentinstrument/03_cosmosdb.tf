resource "azurerm_resource_group" "cosmosdb_pi_rg" {
  name     = format("%s-cosmosdb-rg", local.project)
  location = var.location

  tags = var.tags
}

module "cosmosdb_pi_snet" {
  source               = "git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet?ref=v4.3.1"
  name                 = format("%s-cosmosb-snet", local.project)
  address_prefixes     = var.cidr_subnet_cosmosdb_pi
  resource_group_name  = local.vnet_resource_group_name
  virtual_network_name = local.vnet_data_name

  private_link_service_network_policies_enabled = true
  private_endpoint_network_policies_enabled     = true

  service_endpoints = [
    "Microsoft.Web",
    "Microsoft.AzureCosmosDB",
  ]
}

module "cosmosdb_account_mongodb" {

  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//cosmosdb_account?ref=v4.3.1"

  name                 = "${local.project}-cosmos-account"
  location             = var.location
  resource_group_name  = azurerm_resource_group.cosmosdb_pi_rg.name
  domain               = var.domain
  offer_type           = var.cosmos_mongo_db_params.offer_type
  kind                 = var.cosmos_mongo_db_params.kind
  capabilities         = var.cosmos_mongo_db_params.capabilities
  mongo_server_version = var.cosmos_mongo_db_params.server_version
  enable_free_tier     = var.cosmos_mongo_db_params.enable_free_tier

  public_network_access_enabled = var.cosmos_mongo_db_params.public_network_access_enabled

  is_virtual_network_filter_enabled  = var.cosmos_mongo_db_params.is_virtual_network_filter_enabled
  allowed_virtual_network_subnet_ids = []

  private_endpoint_enabled = var.cosmos_mongo_db_params.private_endpoint_enabled
  subnet_id                = module.cosmosdb_pi_snet.id
  private_dns_zone_ids     = [data.azurerm_private_dns_zone.cosmos.id]

  consistency_policy               = var.cosmos_mongo_db_params.consistency_policy
  main_geo_location_location       = azurerm_resource_group.cosmosdb_pi_rg.location
  main_geo_location_zone_redundant = var.cosmos_mongo_db_params.main_geo_location_zone_redundant
  additional_geo_locations         = var.cosmos_mongo_db_params.additional_geo_locations

  backup_continuous_enabled = var.cosmos_mongo_db_params.backup_continuous_enabled

  tags = var.tags
}

resource "azurerm_cosmosdb_mongo_database" "pi" {

  name                = "pi"
  resource_group_name = azurerm_resource_group.cosmosdb_pi_rg.name
  account_name        = module.cosmosdb_account_mongodb.name

  throughput = var.cosmos_mongo_db_pi_params.enable_autoscaling || var.cosmos_mongo_db_pi_params.enable_serverless ? null : var.cosmos_mongo_db_pi_params.throughput

  dynamic "autoscale_settings" {
    for_each = var.cosmos_mongo_db_pi_params.enable_autoscaling && !var.cosmos_mongo_db_pi_params.enable_serverless ? [""] : []
    content {
      max_throughput = var.cosmos_mongo_db_pi_params.enable_serverless.max_throughput
    }
  }
}