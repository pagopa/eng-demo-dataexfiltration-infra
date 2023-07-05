#
# General
#
env_short      = "d"
env            = "dev"
prefix         = "dex"
location       = "westeurope"
location_short = "weu"
domain         = "core"

tags = {
  CreatedBy   = "Terraform"
  Environment = "DEV"
  Owner       = "Demo Data Exfiltration"
  Source      = "https://github.com/pagopa/eng-demo-dataexfiltration-infra"
  CostCenter  = "TS110 - Technology"
}

#
# DNS
#
dns_zone_product_prefix  = "dev.dex"
external_domain          = "pagopa.it"
dns_zone_internal_prefix = "internal.dev.dex"

#
# Network
#

cidr_vnet                = ["10.1.0.0/16"]

cidr_appgateway_subnet       = ["10.1.130.0/24"]
cidr_apim_subnet             = ["10.1.131.0/24"]
cidr_firewall_subnet         = ["10.1.240.0/24"]
cidr_firewall_mng_subnet     = ["10.1.241.0/24"]
cidr_azdoa_subnet            = ["10.1.242.0/24"]
cidr_vpn_subnet              = ["10.1.243.0/24"]
cidr_private_endpoint_subnet = ["10.1.244.0/23"]
cidr_dns_forwarder_subnet    = ["10.1.250.0/29"]

firewall_network_rules = [
  {
    name   = "application-rule"
    action = "Allow"
    rules = [
      {
        policyname            = "aks-to-evh"
        source_addresses      = ["10.2.0.0/17"]
        destination_ports     = ["9093"]
        destination_addresses = ["10.3.3.0/27"]
        protocols             = ["TCP"]
      },
      {
        policyname            = "aks-to-storage"
        source_addresses      = ["10.2.0.0/17"]
        destination_ports     = ["443"]
        destination_addresses = ["10.3.2.0/27"]
        protocols             = ["TCP"]
      },
      {
        policyname            = "aks-callback"
        source_addresses      = ["10.2.0.0/17"]
        destination_ports     = ["*"]
        destination_addresses = ["10.2.0.0/17"]
        protocols             = ["Any"]
      },
      {
        policyname            = "aks-to-cosmos"
        source_addresses      = ["10.2.0.0/17"]
        destination_ports     = ["*"]
        destination_addresses = ["10.3.1.0/27"]
        protocols             = ["TCP"]
      },
      {
        policyname            = "aks-to-keyvault"
        source_addresses      = ["10.2.0.0/17"]
        destination_ports     = ["*"]
        destination_addresses = ["10.3.4.0/27"]
        protocols             = ["TCP"]
      },
    ]
  },
  {
    name   = "frontend-rule"
    action = "Allow"
    rules = [
      {
        policyname            = "ft-to-aks"
        source_addresses      = ["10.1.0.0/16"]
        destination_ports     = ["443"]
        destination_addresses = ["10.2.0.0/17"]
        protocols             = ["TCP"]
      },
    ]
  },
]

firewall_application_rules = [
  {
    name   = "internet"
    action = "Allow"
    rules = [
      {
        policyname       = "microsoft-default-https"
        source_addresses = ["10.0.0.0/8"]
        target_fqdns     = ["*.microsoft.com", "aksrepos.azurecr.io", "*blob.core.windows.net", "mcr.microsoft.com", "*cdn.mscr.io", "*.data.mcr.microsoft.com", "management.azure.com", "login.microsoftonline.com", "ntp.ubuntu.com", "packages.microsoft.com", "acs-mirror.azureedge.net"]
        protocol = {
          type = "Https"
          port = "443"
        }
      },
      {
        policyname       = "microsoft-default-http"
        source_addresses = ["10.0.0.0/8"]
        target_fqdns     = ["*.microsoft.com", "aksrepos.azurecr.io", "*blob.core.windows.net", "mcr.microsoft.com", "*cdn.mscr.io", "*.data.mcr.microsoft.com", "management.azure.com", "login.microsoftonline.com", "ntp.ubuntu.com", "packages.microsoft.com", "acs-mirror.azureedge.net"]
        protocol = {
          type = "Http"
          port = "80"
        }
      },

    ]
  },
]

firewall_application_rules_tags = [
  {
    name   = "aks-internal"
    action = "Allow"
    rules = [
      {
        policyname = "aks-fqdn"

        source_addresses = [
          "10.1.0.0/16",
          "10.2.0.0/16",
        ]

        fqdn_tags = [
          "AzureKubernetesService",
        ]
      },
    ]
  },
]