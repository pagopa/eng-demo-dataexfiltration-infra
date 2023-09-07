## Application gateway public ip ##
resource "azurerm_public_ip" "appgateway" {
  name                = format("%s-appgateway-pip", local.project)
  resource_group_name = azurerm_resource_group.rg_vnet.name
  location            = azurerm_resource_group.rg_vnet.location
  sku                 = "Standard"
  allocation_method   = "Static"
  zones               = [1, 2, 3]

  tags = var.tags
}

# Subnet to host the application gateway
module "appgateway_snet" {
  source                                    = "git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet?ref=v7.4.1"
  name                                      = format("%s-appgateway-snet", local.project)
  address_prefixes                          = var.cidr_appgateway_subnet
  resource_group_name                       = azurerm_resource_group.rg_vnet.name
  virtual_network_name                      = module.vnet.name
  private_endpoint_network_policies_enabled = true

  service_endpoints = [
    "Microsoft.Web",
  ]
}

## Application gateway ##
module "app_gw" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//app_gateway?ref=v7.4.1"

  resource_group_name = azurerm_resource_group.rg_vnet.name
  location            = azurerm_resource_group.rg_vnet.location
  name                = format("%s-appgateway", local.project)

  # SKU
  sku_name    = "Standard_v2"
  sku_tier    = "Standard_v2"
  waf_enabled = false

  # Networking
  subnet_id    = module.appgateway_snet.id
  public_ip_id = azurerm_public_ip.appgateway.id

  # Configure backends
  backends = {

    apim = {
      protocol                    = "Https"
      host                        = format("api.internal.%s.%s", var.dns_zone_product_prefix, var.external_domain)
      port                        = 443
      ip_addresses                = null # with null value use fqdns
      fqdns                       = [format("api.internal.%s.%s", var.dns_zone_product_prefix, var.external_domain)]
      probe                       = "/status-0123456789abcdef"
      probe_name                  = "probe-apim"
      request_timeout             = 180
      pick_host_name_from_backend = false
    }

  }

  ssl_profiles = []

  trusted_client_certificates = []

  # Configure listeners
  listeners = {

    api = {
      protocol           = "Https"
      host               = format("api.%s.%s", var.dns_zone_product_prefix, var.external_domain)
      port               = 443
      ssl_profile_name   = null
      firewall_policy_id = null

      certificate = {
        name = "api.dev.dex.pagopa.it"
        id = replace(
          data.azurerm_key_vault_certificate.appgateway_api.secret_id,
          "/${data.azurerm_key_vault_certificate.appgateway_api.version}",
          ""
        )
      }
    }

  }

  # maps listener to backend
  routes = {

    api-io-pagopa-it = {
      listener              = "api"
      backend               = "apim"
      rewrite_rule_set_name = "rewrite-rule-set-api"
      priority              = 10
    }

  }

  rewrite_rule_sets = [
    {
      name = "rewrite-rule-set-api"
      rewrite_rules = [{
        name          = "http-headers-api"
        rule_sequence = 100
        conditions    = []
        url           = null
        request_header_configurations = [
          {
            header_name  = "X-Forwarded-For"
            header_value = "{var_client_ip}"
          },
          {
            header_name  = "X-Client-Ip"
            header_value = "{var_client_ip}"
          },
        ]
        response_header_configurations = []
      }]
    }
  ]

  # TLS
  identity_ids = [azurerm_user_assigned_identity.appgateway.id]

  # Scaling
  app_gateway_min_capacity = 0
  app_gateway_max_capacity = 2

  alerts_enabled = false

  tags = var.tags
}

resource "azurerm_user_assigned_identity" "appgateway" {
  resource_group_name = azurerm_resource_group.rg_vnet.name
  location            = azurerm_resource_group.rg_vnet.location
  name                = format("%s-appgateway-identity", local.project)

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "appgateway_policy" {
  key_vault_id            = module.key_vault.id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = azurerm_user_assigned_identity.appgateway.principal_id
  key_permissions         = []
  secret_permissions      = ["Get", "List"]
  certificate_permissions = ["Get", "List"]
  storage_permissions     = []
}

data "azurerm_key_vault_certificate" "appgateway_api" {
  name         = "api-dev-dev-pagopa-it"
  key_vault_id = module.key_vault.id
}
