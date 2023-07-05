<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | <= 2.33.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.30.0, <= 3.43.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | <= 3.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.33.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.43.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azdoa_li"></a> [azdoa\_li](#module\_azdoa\_li) | git::https://github.com/pagopa/terraform-azurerm-v3.git//azure_devops_agent | v5.5.2 |
| <a name="module_azdoa_snet"></a> [azdoa\_snet](#module\_azdoa\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v5.5.2 |
| <a name="module_container_registry"></a> [container\_registry](#module\_container\_registry) | git::https://github.com/pagopa/terraform-azurerm-v3.git//container_registry | v6.2.1 |
| <a name="module_dns_forwarder"></a> [dns\_forwarder](#module\_dns\_forwarder) | git::https://github.com/pagopa/terraform-azurerm-v3.git//dns_forwarder | v5.5.2 |
| <a name="module_dns_forwarder_snet"></a> [dns\_forwarder\_snet](#module\_dns\_forwarder\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v5.5.2 |
| <a name="module_firewall_mng_snet"></a> [firewall\_mng\_snet](#module\_firewall\_mng\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v5.5.2 |
| <a name="module_firewall_snet"></a> [firewall\_snet](#module\_firewall\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v5.5.2 |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | git::https://github.com/pagopa/terraform-azurerm-v3//key_vault | v5.5.2 |
| <a name="module_route_table_aks"></a> [route\_table\_aks](#module\_route\_table\_aks) | git::https://github.com/pagopa/terraform-azurerm-v3.git//route_table | v5.5.2 |
| <a name="module_vnet_app"></a> [vnet\_app](#module\_vnet\_app) | git::https://github.com/pagopa/terraform-azurerm-v3.git//virtual_network | v5.5.2 |
| <a name="module_vnet_data"></a> [vnet\_data](#module\_vnet\_data) | git::https://github.com/pagopa/terraform-azurerm-v3.git//virtual_network | v5.5.2 |
| <a name="module_vnet_ft"></a> [vnet\_ft](#module\_vnet\_ft) | git::https://github.com/pagopa/terraform-azurerm-v3.git//virtual_network | v5.5.2 |
| <a name="module_vnet_hub"></a> [vnet\_hub](#module\_vnet\_hub) | git::https://github.com/pagopa/terraform-azurerm-v3.git//virtual_network | v5.5.2 |
| <a name="module_vnet_hub_app_peering"></a> [vnet\_hub\_app\_peering](#module\_vnet\_hub\_app\_peering) | git::https://github.com/pagopa/terraform-azurerm-v3.git//virtual_network_peering | v5.5.2 |
| <a name="module_vnet_hub_data_peering"></a> [vnet\_hub\_data\_peering](#module\_vnet\_hub\_data\_peering) | git::https://github.com/pagopa/terraform-azurerm-v3.git//virtual_network_peering | v5.5.2 |
| <a name="module_vnet_hub_ft_peering"></a> [vnet\_hub\_ft\_peering](#module\_vnet\_hub\_ft\_peering) | git::https://github.com/pagopa/terraform-azurerm-v3.git//virtual_network_peering | v5.5.2 |
| <a name="module_vpn"></a> [vpn](#module\_vpn) | git::https://github.com/pagopa/terraform-azurerm-v3.git//vpn_gateway | v5.5.2 |
| <a name="module_vpn_snet"></a> [vpn\_snet](#module\_vpn\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v5.5.2 |

## Resources

| Name | Type |
|------|------|
| [azurerm_application_insights.application_insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_disk_encryption_set.pci_enc_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set) | resource |
| [azurerm_firewall.fw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall) | resource |
| [azurerm_firewall_application_rule_collection.fw_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_application_rule_collection) | resource |
| [azurerm_firewall_application_rule_collection.fw_app_tags](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_application_rule_collection) | resource |
| [azurerm_firewall_network_rule_collection.fw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_network_rule_collection) | resource |
| [azurerm_key_vault_access_policy.ad_group_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.adgroup_developers_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.azdevops_iac_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.enc-disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_key.disk_enc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_log_analytics_workspace.log_analytics_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_action_group.email](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_monitor_action_group.error_action_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_monitor_action_group.slack](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_private_dns_zone.internal_pci_pagopa_it](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.key_vault_dns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_mongo_cosmos_azure_com](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.all_to_vnet_hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.internal_pci_vnetlink_vnet_core](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_blob_azure_com_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_keyvault_azure_com_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.vnet_privatelink_mongo_cosmos_azure_com](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.fw_mbg_pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_public_ip.fw_pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.azdo_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.container_registry_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.default_roleassignment_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.monitor_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.rg_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.sec_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.enc-disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [null_resource.dummy](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [azuread_application.vpn_app](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/application) | data source |
| [azuread_group.adgroup_admin](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_group.adgroup_developers](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_group.adgroup_externals](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_group.adgroup_security](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_service_principal.iac_principal](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault_secret.alert_error_notification_email](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.alert_error_notification_slack](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.monitor_notification_email](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.monitor_notification_slack_email](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_resources.sub_resources](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resources) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_application_vnet"></a> [cidr\_application\_vnet](#input\_cidr\_application\_vnet) | Address prefixes vnet application | `list(string)` | `null` | no |
| <a name="input_cidr_azdoa_subnet"></a> [cidr\_azdoa\_subnet](#input\_cidr\_azdoa\_subnet) | Address prefixes subnet azdoa | `list(string)` | `null` | no |
| <a name="input_cidr_data_vnet"></a> [cidr\_data\_vnet](#input\_cidr\_data\_vnet) | Address prefixes vnet database | `list(string)` | `null` | no |
| <a name="input_cidr_firewall_mng_subnet"></a> [cidr\_firewall\_mng\_subnet](#input\_cidr\_firewall\_mng\_subnet) | Address prefixes subnet management firewall | `list(string)` | `null` | no |
| <a name="input_cidr_firewall_subnet"></a> [cidr\_firewall\_subnet](#input\_cidr\_firewall\_subnet) | Address prefixes subnet firewall | `list(string)` | `null` | no |
| <a name="input_cidr_frontend_vnet"></a> [cidr\_frontend\_vnet](#input\_cidr\_frontend\_vnet) | Address prefixes vnet frontend | `list(string)` | `null` | no |
| <a name="input_cidr_hub_vnet"></a> [cidr\_hub\_vnet](#input\_cidr\_hub\_vnet) | Address prefixes vnet hub | `list(string)` | `null` | no |
| <a name="input_cidr_subnet_dns_forwarder"></a> [cidr\_subnet\_dns\_forwarder](#input\_cidr\_subnet\_dns\_forwarder) | Address prefixes subnet vpn forwarder | `list(string)` | `null` | no |
| <a name="input_cidr_vpn_subnet"></a> [cidr\_vpn\_subnet](#input\_cidr\_vpn\_subnet) | Address prefixes subnet vpn | `list(string)` | `null` | no |
| <a name="input_dns_zone_internal_prefix"></a> [dns\_zone\_internal\_prefix](#input\_dns\_zone\_internal\_prefix) | The dns subdomain. | `string` | `null` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | n/a | yes |
| <a name="input_enable_azdoa"></a> [enable\_azdoa](#input\_enable\_azdoa) | If true enable azure devops iac pipelines. | `bool` | `true` | no |
| <a name="input_enable_iac_pipeline"></a> [enable\_iac\_pipeline](#input\_enable\_iac\_pipeline) | If true create the key vault policy to allow used by azure devops iac pipelines. | `bool` | `true` | no |
| <a name="input_enable_region_dr"></a> [enable\_region\_dr](#input\_enable\_region\_dr) | If set to true, enable region dr | `bool` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_env_short"></a> [env\_short](#input\_env\_short) | n/a | `string` | n/a | yes |
| <a name="input_external_domain"></a> [external\_domain](#input\_external\_domain) | Domain for delegation | `string` | `null` | no |
| <a name="input_firewall_application_rules"></a> [firewall\_application\_rules](#input\_firewall\_application\_rules) | Microsoft-managed virtual network that enables connectivity from other resources. | <pre>list(object({<br>    name        = string<br>    description = optional(string)<br>    action      = string<br>    rules = list(object({<br>      policyname       = string<br>      source_addresses = optional(list(string))<br>      source_ip_groups = optional(list(string))<br>      fqdn_tags        = optional(list(string))<br>      target_fqdns     = optional(list(string))<br>      protocol = optional(object({<br>        type = string<br>        port = string<br>      }))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_firewall_application_rules_tags"></a> [firewall\_application\_rules\_tags](#input\_firewall\_application\_rules\_tags) | Microsoft-managed virtual network that enables connectivity from other resources. | <pre>list(object({<br>    name        = string<br>    description = optional(string)<br>    action      = string<br>    rules = list(object({<br>      policyname       = string<br>      source_addresses = optional(list(string))<br>      source_ip_groups = optional(list(string))<br>      fqdn_tags        = optional(list(string))<br>      target_fqdns     = optional(list(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_firewall_network_rules"></a> [firewall\_network\_rules](#input\_firewall\_network\_rules) | List of network rules to apply to firewall. | <pre>list(object({<br>    name        = string<br>    description = optional(string)<br>    action      = string<br>    rules = list(object({<br>      policyname            = string<br>      source_addresses      = optional(list(string))<br>      destination_ports     = list(string)<br>      destination_addresses = optional(list(string))<br>      destination_fqdns     = optional(list(string))<br>      protocols             = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_law_daily_quota_gb"></a> [law\_daily\_quota\_gb](#input\_law\_daily\_quota\_gb) | The workspace daily quota for ingestion in GB. | `number` | `-1` | no |
| <a name="input_law_retention_in_days"></a> [law\_retention\_in\_days](#input\_law\_retention\_in\_days) | The workspace data retention in days | `number` | `30` | no |
| <a name="input_law_sku"></a> [law\_sku](#input\_law\_sku) | Sku of the Log Analytics Workspace | `string` | `"PerGB2018"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"westeurope"` | no |
| <a name="input_location_dr"></a> [location\_dr](#input\_location\_dr) | n/a | `string` | `"northeurope"` | no |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | Location short like eg: neu, weu.. | `string` | n/a | yes |
| <a name="input_location_short_dr"></a> [location\_short\_dr](#input\_location\_short\_dr) | Location short like eg: neu, weu.. | `string` | n/a | yes |
| <a name="input_pci_availability_zones"></a> [pci\_availability\_zones](#input\_pci\_availability\_zones) | List of zones | `list(string)` | <pre>[<br>  "1"<br>]</pre> | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | <pre>{<br>  "CreatedBy": "Terraform"<br>}</pre> | no |
| <a name="input_vpn_pip_sku"></a> [vpn\_pip\_sku](#input\_vpn\_pip\_sku) | VPN GW PIP SKU | `string` | `"Basic"` | no |
| <a name="input_vpn_sku"></a> [vpn\_sku](#input\_vpn\_sku) | VPN Gateway SKU | `string` | `"VpnGw1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
