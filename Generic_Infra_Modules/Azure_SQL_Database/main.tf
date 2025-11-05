resource "azurerm_mssql_database" "mssql_db" {

  for_each = var.sql_dbs

  name                                = each.value.name
  server_id                           = each.value.server_id                       
  collation                           = each.value.collation
  license_type                        = each.value.license_type
  max_size_gb                         = each.value.max_size_gb
  read_scale                          = each.value.read_scale
  sku_name                            = each.value.sku_name
  zone_redundant                      = each.value.zone_redundant
  enclave_type                        = each.value.enclave_type
  create_mode                         = each.value.create_mode
  storage_account_type                = each.value.storage_account_type
  transparent_data_encryption_enabled = each.value.transparent_data_encryption_enabled
  secondary_type                      = each.value.secondary_type

  elastic_pool_id                = each.value.elastic_pool_id
  geo_backup_enabled             = each.value.geo_backup_enabled
  maintenance_configuration_name = each.value.maintenance_configuration_name
  ledger_enabled                 = each.value.ledger_enabled
  min_capacity                   = each.value.min_capacity
  recover_database_id            = each.value.recover_database_id
  recovery_point_id              = each.value.recovery_point_id

  dynamic "import" {

    for_each = each.value.import != null ? [each.value.import] : []

    content {

      storage_uri                  = import.value.storage_uri
      storage_key                  = import.value.storage_key
      storage_key_type             = import.value.storage_key_type
      administrator_login          = import.value.administrator_login
      administrator_login_password = import.value.administrator_login_password
      authentication_type          = import.value.authentication_type
      storage_account_id           = import.value.storage_account_id
    }
  }


  dynamic "threat_detection_policy" {

    for_each = each.value.threat_detection_policy != null ? [each.value.threat_detection_policy] : []

    content {
      state                      = threat_detection_policy.value.state
      disabled_alerts            = threat_detection_policy.value.disabled_alerts
      email_account_admins       = threat_detection_policy.value.email_account_admins
      email_addresses            = threat_detection_policy.value.email_addresses
      retention_days             = threat_detection_policy.value.retention_days
      storage_account_access_key = threat_detection_policy.value.storage_account_access_key
    }

  }

  dynamic "identity" {

    for_each = each.value.identity != null ? [each.value.identity] : []

    content {

      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }

  }

  tags = each.value.tags
}
