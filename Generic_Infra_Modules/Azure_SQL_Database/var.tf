variable "sql_dbs" {
  type = map(object(
    {
      name     = string
      sku_name = string
      server_id = string

      collation                           = optional(string)
      license_type                        = optional(string)
      max_size_gb                         = optional(number)
      read_scale                          = optional(bool)
      zone_redundant                      = optional(bool)
      enclave_type                        = optional(string)
      create_mode                         = optional(string)
      storage_account_type                = optional(string)
      transparent_data_encryption_enabled = optional(bool)
      secondary_type                      = optional(string)

      elastic_pool_id                = optional(string)
      geo_backup_enabled             = optional(bool)
      maintenance_configuration_name = optional(string)
      ledger_enabled                 = optional(bool)
      min_capacity                   = optional(number)
      recover_database_id            = optional(string)
      recovery_point_id              = optional(string)

      # Optional blocks
      import = optional(object(
        {
          storage_uri                  = string
          storage_key                  = string
          storage_key_type             = string
          administrator_login          = string
          administrator_login_password = string
          authentication_type          = string
          storage_account_id           = string
        }
      ))

      threat_detection_policy = optional(object(
        {
          state                      = optional(string)
          disabled_alerts            = optional(list(string))
          email_account_admins       = optional(string)
          email_addresses            = optional(list(string))
          retention_days             = optional(number)
          storage_account_access_key = optional(string)
      }))

      identity = optional(object({

        type         = optional(string)
        identity_ids = optional(list(string))
        
      }))

      tags = optional(map(string), {})
    }
  ))
}

