prefix         = "pci"
env_short      = "d"
env            = "dev"
domain         = "pi"
location       = "westeurope"
location_short = "weu"
instance       = "dev"

tags = {
  CreatedBy   = "Terraform"
  Environment = "Dev"
  Owner       = "pci"
  Source      = "https://github.com/pagopa/pci-infra/src/domains/paymentinstrument"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}

### External resources

monitor_resource_group_name                 = "pci-d-weu-core-monitor-rg"
log_analytics_workspace_name                = "pci-d-weu-core-law"
log_analytics_workspace_resource_group_name = "pci-d-weu-core-monitor-rg"

### Aks

ingress_load_balancer_ip = "10.2.100.250"

external_domain          = "pagopa.it"
dns_zone_internal_prefix = "internal.dev.pci"

### Cosmos

cosmos_mongo_db_params = {
  enabled      = true
  kind         = "MongoDB"
  capabilities = ["EnableMongo", "EnableServerless"]
  offer_type   = "Standard"
  consistency_policy = {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100000
  }
  server_version                   = "4.0"
  main_geo_location_zone_redundant = false
  enable_free_tier                 = true

  additional_geo_locations          = []
  private_endpoint_enabled          = true
  public_network_access_enabled     = false
  is_virtual_network_filter_enabled = false

  backup_continuous_enabled = false

}

cidr_subnet_cosmosdb_pi = ["10.3.1.0/27"]
cidr_subnet_storage_pi  = ["10.3.2.0/27"]
cidr_subnet_eventhub    = ["10.3.3.0/27"]
cidr_subnet_keyvault    = ["10.3.4.0/27"]

cosmos_mongo_db_pi_params = {
  enable_serverless  = true
  enable_autoscaling = true
  max_throughput     = 5000
  throughput         = 1000
}


pi_storage_params = {
  enabled                    = true
  tier                       = "Standard"
  kind                       = "StorageV2"
  account_replication_type   = "LRS",
  advanced_threat_protection = true,
  retention_days             = 7
}

enable_iac_pipeline = true

ehns_sku_name = "Standard"

ehns_alerts_enabled = false
ehns_metric_alerts = {
  no_trx = {
    aggregation = "Total"
    metric_name = "IncomingMessages"
    description = "No messagge received in the last 24h"
    operator    = "LessThanOrEqual"
    threshold   = 1000
    frequency   = "PT1H"
    window_size = "P1D"
    dimension = [
      {
        name     = "EntityName"
        operator = "Include"
        values = [
          "nodo-dei-pagamenti-log",
          "nodo-dei-pagamenti-re"
        ]
      }
    ],
  },
  active_connections = {
    aggregation = "Average"
    metric_name = "ActiveConnections"
    description = null
    operator    = "LessThanOrEqual"
    threshold   = 0
    frequency   = "PT5M"
    window_size = "PT15M"
    dimension   = [],
  },
  error_trx = {
    aggregation = "Total"
    metric_name = "IncomingMessages"
    description = "rejected received. trx write on eventhub. check immediately"
    operator    = "GreaterThan"
    threshold   = 0
    frequency   = "PT5M"
    window_size = "PT30M"
    dimension = [
      {
        name     = "EntityName"
        operator = "Include"
        values = [
          "nodo-dei-pagamenti-log",
          "nodo-dei-pagamenti-re"
        ]
      }
    ],
  },
}

eventhubs = [
  {
    name              = "migration-pi"
    message_retention = 1
    partitions        = 1
    consumers = [
      "migration-pi-consumer-group"
    ]
    keys = [
      {
        name   = "migration-pi-consumer-policy"
        listen = true
        send   = false
        manage = false
      },
      {
        name   = "migration-pi-producer-policy"
        listen = false
        send   = true
        manage = false
      }
    ]
  }
]