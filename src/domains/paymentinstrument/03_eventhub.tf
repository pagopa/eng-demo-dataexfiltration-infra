resource "azurerm_resource_group" "msg_rg" {
  name     = format("%s-msg-rg", local.project)
  location = var.location

  tags = var.tags
}

## Eventhub subnet
module "eventhub_snet" {
  source                                        = "git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet?ref=v4.3.1"
  name                                          = format("%s-eventhub-snet", local.project)
  address_prefixes                              = var.cidr_subnet_eventhub
  resource_group_name                           = local.vnet_resource_group_name
  virtual_network_name                          = local.vnet_data_name
  service_endpoints                             = ["Microsoft.EventHub"]
  private_link_service_network_policies_enabled = true
  private_endpoint_network_policies_enabled     = true
}

module "event_hub01" {
  source                   = "git::https://github.com/pagopa/terraform-azurerm-v3.git//eventhub?ref=v5.3.0"
  name                     = format("%s-evh-ns01", local.project)
  location                 = var.location
  resource_group_name      = azurerm_resource_group.msg_rg.name
  auto_inflate_enabled     = var.ehns_auto_inflate_enabled
  sku                      = var.ehns_sku_name
  capacity                 = var.ehns_capacity
  maximum_throughput_units = var.ehns_maximum_throughput_units
  zone_redundant           = var.ehns_zone_redundant
  virtual_network_ids      = [data.azurerm_virtual_network.vnet_data.id, data.azurerm_virtual_network.vnet_app.id]
  subnet_id                = module.eventhub_snet.id

  eventhubs = var.eventhubs

  alerts_enabled = var.ehns_alerts_enabled
  metric_alerts  = var.ehns_metric_alerts
  action = [
    {
      action_group_id    = data.azurerm_monitor_action_group.slack.id
      webhook_properties = null
    },
    {
      action_group_id    = data.azurerm_monitor_action_group.email.id
      webhook_properties = null
    }
  ]

  tags = var.tags
}

resource "azurerm_key_vault_secret" "event_hub_keys" {
  for_each = module.event_hub01.key_ids

  name         = format("evh-%s-%s", replace(each.value.key.name, ".", "-"), "key")
  value        = module.event_hub01.keys[each.key].primary_key
  content_type = "text/plain"

  key_vault_id = module.key_vault.id
}
