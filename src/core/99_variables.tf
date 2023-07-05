# general

variable "prefix" {
  type = string
  validation {
    condition = (
      length(var.prefix) <= 6
    )
    error_message = "Max length is 6 chars."
  }
}

variable "env" {
  type = string
  validation {
    condition = (
      length(var.env) <= 3
    )
    error_message = "Max length is 3 chars."
  }
}

variable "env_short" {
  type = string
  validation {
    condition = (
      length(var.env_short) <= 1
    )
    error_message = "Max length is 1 chars."
  }
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "location_short" {
  type        = string
  description = "Location short like eg: neu, weu.."
}

variable "tags" {
  type = map(any)
  default = {
    CreatedBy = "Terraform"
  }
}

variable "domain" {
  type = string
  validation {
    condition = (
      length(var.domain) <= 12
    )
    error_message = "Max length is 12 chars."
  }
}

variable "adgroup_prefix" {
  type = string
  validation {
    condition = (
      length(var.adgroup_prefix) <= 12
    )
    error_message = "Max length is 12 chars."
  }
  default = "dvopla"
}

variable "cidr_vnet" {
  type        = list(string)
  description = "Address prefixes vnet frontend"
  default     = null
}

variable "cidr_firewall_subnet" {
  type        = list(string)
  description = "Address prefixes subnet firewall"
  default     = null
}

variable "cidr_firewall_mng_subnet" {
  type        = list(string)
  description = "Address prefixes subnet management firewall"
  default     = null
}

variable "cidr_azdoa_subnet" {
  type        = list(string)
  description = "Address prefixes subnet azdoa"
  default     = null
}

variable "cidr_vpn_subnet" {
  type        = list(string)
  description = "Address prefixes subnet vpn"
  default     = null
}

variable "cidr_dns_forwarder_subnet" {
  type        = list(string)
  description = "Address prefixes subnet vpn forwarder"
  default     = null
}

variable "cidr_private_endpoint_subnet" {
  type        = list(string)
  description = "Address prefixes subnet for private endpoints"
  default     = null
}

variable "cidr_appgateway_subnet" {
  type        = list(string)
  description = "Address prefixes subnet for appgateway"
  default     = null
}

## Monitor
variable "law_sku" {
  type        = string
  description = "Sku of the Log Analytics Workspace"
  default     = "PerGB2018"
}

variable "law_retention_in_days" {
  type        = number
  description = "The workspace data retention in days"
  default     = 30
}

variable "law_daily_quota_gb" {
  type        = number
  description = "The workspace daily quota for ingestion in GB."
  default     = 1
}

variable "external_domain" {
  type        = string
  default     = null
  description = "Domain for delegation"
}

variable "dns_zone_internal_prefix" {
  type        = string
  default     = null
  description = "The dns subdomain."
}

variable "dns_zone_product_prefix" {
  type        = string
  default     = null
  description = "The dns subdomain."
}

variable "pci_availability_zones" {
  type        = list(string)
  default     = ["1"]
  description = "List of zones"
}

variable "firewall_network_rules" {
  description = "List of network rules to apply to firewall."
  type = list(object({
    name        = string
    description = optional(string)
    action      = string
    rules = list(object({
      policyname            = string
      source_addresses      = optional(list(string))
      destination_ports     = list(string)
      destination_addresses = optional(list(string))
      destination_fqdns     = optional(list(string))
      protocols             = list(string)
    }))
  }))
  default = []
}

variable "firewall_application_rules" {
  description = "Microsoft-managed virtual network that enables connectivity from other resources."
  type = list(object({
    name        = string
    description = optional(string)
    action      = string
    rules = list(object({
      policyname       = string
      source_addresses = optional(list(string))
      source_ip_groups = optional(list(string))
      fqdn_tags        = optional(list(string))
      target_fqdns     = optional(list(string))
      protocol = optional(object({
        type = string
        port = string
      }))
    }))
  }))
  default = []
}

variable "firewall_application_rules_tags" {
  description = "Microsoft-managed virtual network that enables connectivity from other resources."
  type = list(object({
    name        = string
    description = optional(string)
    action      = string
    rules = list(object({
      policyname       = string
      source_addresses = optional(list(string))
      source_ip_groups = optional(list(string))
      fqdn_tags        = optional(list(string))
      target_fqdns     = optional(list(string))
    }))
  }))
  default = []
}

## VPN ##
variable "vpn_sku" {
  type        = string
  default     = "VpnGw1"
  description = "VPN Gateway SKU"
}

variable "vpn_pip_sku" {
  type        = string
  default     = "Basic"
  description = "VPN GW PIP SKU"
}
