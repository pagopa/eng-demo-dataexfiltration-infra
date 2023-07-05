resource "azurerm_resource_group" "azdo_rg" {
  name     = format("%s-azdoa-rg", local.project)
  location = var.location

  tags = var.tags
}

module "azdoa_snet" {
  source                                        = "git::https://github.com/pagopa/terraform-azurerm-v3.git//subnet?ref=v6.2.2"
  name                                          = format("%s-azdoa-snet", local.project)
  address_prefixes                              = var.cidr_azdoa_subnet
  resource_group_name                           = azurerm_resource_group.rg_vnet.name
  virtual_network_name                          = module.vnet.name
  private_link_service_network_policies_enabled = true
  private_endpoint_network_policies_enabled     = true
}

module "azdoa_li" {
  source              = "git::https://github.com/pagopa/terraform-azurerm-v3.git//azure_devops_agent?ref=v6.2.2"
  name                = format("%s-azdoa-vmss-li", local.project)
  resource_group_name = azurerm_resource_group.azdo_rg.name
  subnet_id           = module.azdoa_snet.id
  subscription        = data.azurerm_subscription.current.display_name

  tags = var.tags
}

/* # azure devops policy
data "azuread_service_principal" "iac_principal" {
  count        = var.enable_iac_pipeline ? 1 : 0
  display_name = format("pagopaspa-pci-iac-%s", data.azurerm_subscription.current.subscription_id)
}

resource "azurerm_key_vault_access_policy" "azdevops_iac_policy" {
  count        = var.enable_iac_pipeline ? 1 : 0
  key_vault_id = module.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azuread_service_principal.iac_principal[0].object_id

  secret_permissions = ["Get", "List", "Set", ]

  certificate_permissions = ["SetIssuers", "DeleteIssuers", "Purge", "List", "Get"]

  storage_permissions = []
} */
