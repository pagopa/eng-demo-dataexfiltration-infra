<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.5.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | <= 2.33.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | <= 3.71.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | <= 3.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.33.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.71.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_gw"></a> [app\_gw](#module\_app\_gw) | git::https://github.com/pagopa/terraform-azurerm-v3.git//app_gateway | v7.4.1 |
| <a name="module_appgateway_snet"></a> [appgateway\_snet](#module\_appgateway\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v7.4.1 |
| <a name="module_azdoa_li"></a> [azdoa\_li](#module\_azdoa\_li) | git::https://github.com/pagopa/terraform-azurerm-v3.git//azure_devops_agent | v7.4.1 |
| <a name="module_azdoa_snet"></a> [azdoa\_snet](#module\_azdoa\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v7.4.1 |
| <a name="module_dns_forwarder"></a> [dns\_forwarder](#module\_dns\_forwarder) | git::https://github.com/pagopa/terraform-azurerm-v3.git//dns_forwarder | v7.4.1 |
| <a name="module_dns_forwarder_snet"></a> [dns\_forwarder\_snet](#module\_dns\_forwarder\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v7.4.1 |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | git::https://github.com/pagopa/terraform-azurerm-v3.git//key_vault | v7.4.1 |
| <a name="module_private_endpoint_snet"></a> [private\_endpoint\_snet](#module\_private\_endpoint\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v7.4.1 |
| <a name="module_route_table_aks"></a> [route\_table\_aks](#module\_route\_table\_aks) | git::https://github.com/pagopa/terraform-azurerm-v3.git//route_table | v7.4.1 |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//virtual_network | v7.4.1 |
| <a name="module_vpn"></a> [vpn](#module\_vpn) | git::https://github.com/pagopa/terraform-azurerm-v3.git//vpn_gateway | v7.4.1 |
| <a name="module_vpn_snet"></a> [vpn\_snet](#module\_vpn\_snet) | git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet | v7.4.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_application_insights.application_insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_key_vault_access_policy.adgroup_admin_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.adgroup_developers_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.appgateway_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_log_analytics_workspace.log_analytics_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_private_dns_zone.internal_pagopa_it](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_blob_core_windows_net](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_mongo_cosmos_azure_com](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone.privatelink_vaultcore_azure_net](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.internal_pagopa_it_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_blob_core_windows_net_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_keyvault_azure_com_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_dns_zone_virtual_network_link.privatelink_mongo_cosmos_azure_com_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.appgateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.azdo_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.default_roleassignment_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.monitor_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.rg_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.sec_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_user_assigned_identity.appgateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azuread_application.vpn_app](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/application) | data source |
| [azuread_group.adgroup_admin](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_group.adgroup_developers](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_group.adgroup_externals](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_group.adgroup_security](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault_certificate.appgateway_api](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_certificate) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_adgroup_prefix"></a> [adgroup\_prefix](#input\_adgroup\_prefix) | n/a | `string` | `"dvopla"` | no |
| <a name="input_cidr_appgateway_subnet"></a> [cidr\_appgateway\_subnet](#input\_cidr\_appgateway\_subnet) | Address prefixes subnet for appgateway | `list(string)` | `null` | no |
| <a name="input_cidr_azdoa_subnet"></a> [cidr\_azdoa\_subnet](#input\_cidr\_azdoa\_subnet) | Address prefixes subnet azdoa | `list(string)` | `null` | no |
| <a name="input_cidr_dns_forwarder_subnet"></a> [cidr\_dns\_forwarder\_subnet](#input\_cidr\_dns\_forwarder\_subnet) | Address prefixes subnet vpn forwarder | `list(string)` | `null` | no |
| <a name="input_cidr_firewall_mng_subnet"></a> [cidr\_firewall\_mng\_subnet](#input\_cidr\_firewall\_mng\_subnet) | Address prefixes subnet management firewall | `list(string)` | `null` | no |
| <a name="input_cidr_firewall_subnet"></a> [cidr\_firewall\_subnet](#input\_cidr\_firewall\_subnet) | Address prefixes subnet firewall | `list(string)` | `null` | no |
| <a name="input_cidr_private_endpoint_subnet"></a> [cidr\_private\_endpoint\_subnet](#input\_cidr\_private\_endpoint\_subnet) | Address prefixes subnet for private endpoints | `list(string)` | `null` | no |
| <a name="input_cidr_vnet"></a> [cidr\_vnet](#input\_cidr\_vnet) | Address prefixes vnet frontend | `list(string)` | `null` | no |
| <a name="input_cidr_vpn_subnet"></a> [cidr\_vpn\_subnet](#input\_cidr\_vpn\_subnet) | Address prefixes subnet vpn | `list(string)` | `null` | no |
| <a name="input_dns_zone_internal_prefix"></a> [dns\_zone\_internal\_prefix](#input\_dns\_zone\_internal\_prefix) | The dns subdomain. | `string` | `null` | no |
| <a name="input_dns_zone_product_prefix"></a> [dns\_zone\_product\_prefix](#input\_dns\_zone\_product\_prefix) | The dns subdomain. | `string` | `null` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_env_short"></a> [env\_short](#input\_env\_short) | n/a | `string` | n/a | yes |
| <a name="input_external_domain"></a> [external\_domain](#input\_external\_domain) | Domain for delegation | `string` | `null` | no |
| <a name="input_firewall_application_rules"></a> [firewall\_application\_rules](#input\_firewall\_application\_rules) | Microsoft-managed virtual network that enables connectivity from other resources. | <pre>list(object({<br>    name        = string<br>    description = optional(string)<br>    action      = string<br>    rules = list(object({<br>      policyname       = string<br>      source_addresses = optional(list(string))<br>      source_ip_groups = optional(list(string))<br>      fqdn_tags        = optional(list(string))<br>      target_fqdns     = optional(list(string))<br>      protocol = optional(object({<br>        type = string<br>        port = string<br>      }))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_firewall_application_rules_tags"></a> [firewall\_application\_rules\_tags](#input\_firewall\_application\_rules\_tags) | Microsoft-managed virtual network that enables connectivity from other resources. | <pre>list(object({<br>    name        = string<br>    description = optional(string)<br>    action      = string<br>    rules = list(object({<br>      policyname       = string<br>      source_addresses = optional(list(string))<br>      source_ip_groups = optional(list(string))<br>      fqdn_tags        = optional(list(string))<br>      target_fqdns     = optional(list(string))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_firewall_network_rules"></a> [firewall\_network\_rules](#input\_firewall\_network\_rules) | List of network rules to apply to firewall. | <pre>list(object({<br>    name        = string<br>    description = optional(string)<br>    action      = string<br>    rules = list(object({<br>      policyname            = string<br>      source_addresses      = optional(list(string))<br>      destination_ports     = list(string)<br>      destination_addresses = optional(list(string))<br>      destination_fqdns     = optional(list(string))<br>      protocols             = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_law_daily_quota_gb"></a> [law\_daily\_quota\_gb](#input\_law\_daily\_quota\_gb) | The workspace daily quota for ingestion in GB. | `number` | `1` | no |
| <a name="input_law_retention_in_days"></a> [law\_retention\_in\_days](#input\_law\_retention\_in\_days) | The workspace data retention in days | `number` | `30` | no |
| <a name="input_law_sku"></a> [law\_sku](#input\_law\_sku) | Sku of the Log Analytics Workspace | `string` | `"PerGB2018"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"westeurope"` | no |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | Location short like eg: neu, weu.. | `string` | n/a | yes |
| <a name="input_pci_availability_zones"></a> [pci\_availability\_zones](#input\_pci\_availability\_zones) | List of zones | `list(string)` | <pre>[<br>  "1"<br>]</pre> | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | <pre>{<br>  "CreatedBy": "Terraform"<br>}</pre> | no |
| <a name="input_vpn_pip_sku"></a> [vpn\_pip\_sku](#input\_vpn\_pip\_sku) | VPN GW PIP SKU | `string` | `"Basic"` | no |
| <a name="input_vpn_sku"></a> [vpn\_sku](#input\_vpn\_sku) | VPN Gateway SKU | `string` | `"VpnGw1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
