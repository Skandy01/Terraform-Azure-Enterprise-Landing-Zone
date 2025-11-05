# variable "RGs" {

#   type = map(object({
#     rg_name   = string
#     location  = string
#     owner     = optional(string, "")
#     co_owner  = optional(string, "")
#   }))
# }

variable "RGs" {

  type = map(object(
    {
      rg_name  = string
      location = string
      tags     = optional(map(string), {})

    }
  ))
}

variable "stgs" {

  type = map(object(
    {
      name                          = string
      location                      = string
      rg_name                       = string
      account_replication_type      = string
      account_tier                  = string
      access_tier                   = optional(string, "")
      edge_zone                     = optional(string, null)
      https_traffic_only_enabled    = optional(bool, true)
      min_tls_version               = optional(string, "")
      shared_access_key_enabled     = optional(bool, true)
      public_network_access_enabled = optional(bool, true)
      is_hns_enabled                = optional(bool, true)
      allowed_copy_scope            = optional(string, "AAD")
      dns_endpoint_type             = optional(string, "")

      owner         = optional(string)
      co_owner      = optional(string)
      business_unit = optional(string)

      # network_rules=string
      # last_access_time_enabled=string
    }
  ))
}

variable "vnets" {

  type = map(object(
    {
      name                           = string
      location                       = string
      rg_name                        = string
      address_space                  = optional(list(string), [])
      edge_zone                      = optional(string, null)
      flow_timeout_in_minutes        = optional(number, 5)
      private_endpoint_vnet_policies = optional(string, "Disabled")

      owner         = optional(string)
      co_owner      = optional(string)
      buisness_unit = optional(string)

    }
  ))
}

variable "subnets" {
  type = map(object(
    {
      subnet_name                                   = string
      virtual_network_name                          = string
      resource_group_name                           = string
      address_prefixes                              = optional(list(string))
      default_outbound_access_enabled               = optional(bool)
      private_endpoint_network_policies             = optional(string)
      private_link_service_network_policies_enabled = optional(bool)
      sharing_scope                                 = optional(string)
      service_endpoints                             = optional(list(string))
      service_endpoint_policy_ids                   = optional(list(string))
    }
  ))
}

variable "pips" {
  type = map(object(
    {
      name                = string
      resource_group_name = string
      location            = string
      allocation_method   = string

      zones                   = optional(list(string))
      ddos_protection_mode    = optional(string)
      domain_name_label       = optional(string)
      domain_name_label_scope = optional(string)
      edge_zone               = optional(string)
      idle_timeout_in_minutes = optional(number)
      ip_version              = optional(string)
      sku                     = optional(string)
      public_ip_prefix_id     = optional(string)
      sku_tier                = optional(string)
      ip_tags                 = optional(map(string))

      owner       = optional(string)
      co_owner    = optional(string)
      environment = optional(string)

    }
  ))
}

variable "bastions" {
  type = map(object(
    {
      name                = string
      resource_group_name = string
      location            = string
      copy_paste_enabled  = optional(bool)
      file_copy_enabled   = optional(bool)
      kerberos_enabled    = optional(bool)
      sku                 = optional(string)
      scale_units         = optional(number)
      tunneling_enabled   = optional(bool)
      virtual_network_id  = optional(string)
      zones               = optional(list(string))

      ip_configuration = optional(object(

        {
          name                 = string
          subnet_id            = string
          public_ip_address_id = string
          subnet_key           = optional(string)
          public_key           = optional(string)

        }
      ))

      owner       = optional(string)
      co_owner    = optional(string)
      environment = optional(string)
    }
  ))
}

variable "nics" {

  type = map(object(
    {
      name                = string
      location            = string
      resource_group_name = string

      ip_configuration = object(

        {
          name      = string
          subnet_id = optional(string)

          private_ip_address_allocation = optional(string)
          private_ip_address_version    = optional(string)
          public_ip_address_id          = optional(string)
          subnet_key                    = optional(string)
          public_key                    = optional(string)

          gateway_load_balancer_frontend_ip_configuration_id = optional(string)
          primary                                            = optional(bool)

          # load_balancer_backend_address_pools_ids          = optional(list(string))
          # load_balancer_inbound_nat_rules_ids              = optional(list(string))
        }
      )

      auxiliary_mode                 = optional(string)
      auxiliary_sku                  = optional(string)
      dns_servers                    = optional(list(string))
      edge_zone                      = optional(string)
      ip_forwarding_enabled          = optional(bool)
      accelerated_networking_enabled = optional(bool)

      owner       = optional(string)
      co_owner    = optional(string)
      environment = optional(string)
    }
  ))
}

variable "vms" {

  type = map(object(
    {
      name                  = string
      resource_group_name   = string
      location              = string
      size                  = string
      network_interface_ids = list(string)
      nic_key               = optional(string)

      zone                            = optional(string)
      license_type                    = optional(string)
      disable_password_authentication = optional(bool)
      admin_username                  = optional(string)
      admin_password                  = optional(string)


      os_disk = object({

        caching              = string
        storage_account_type = string

        name                   = optional(string)
        disk_encryption_set_id = optional(string)
        disk_size_gb           = optional(string)

      })

      source_image_reference = optional(object({

        publisher = string
        offer     = string
        sku       = string
        version   = string
      }))

      allow_extension_operations                             = optional(bool)
      bypass_platform_safety_checks_on_user_schedule_enabled = optional(bool)
      capacity_reservation_group_id                          = optional(string)
      dedicated_host_id                                      = optional(string)
      disk_controller_type                                   = optional(string)
      edge_zone                                              = optional(string)
      encryption_at_host_enabled                             = optional(bool)
      eviction_policy                                        = optional(string)
      extensions_time_budget                                 = optional(string)
      priority                                               = optional(string)
      provision_vm_agent                                     = optional(bool)
      proximity_placement_group_id                           = optional(string)
      secure_boot_enabled                                    = optional(bool)
      source_image_id                                        = optional(string)


      admin_ssh_key = optional(object(
        {

          public_key = string
          username   = string
        }

      ))

      plan = optional(object({

        name      = string
        product   = string
        publisher = string

      }))

      owner       = optional(string)
      co_owner    = optional(string)
      environment = optional(string)

    }
  ))
}

variable "key_vault" {

  type = map(object(
    {
      name                = string
      location            = string
      resource_group_name = string
      sku_name            = string
      tenant_id           = string

      enabled_for_deployment          = optional(bool)
      enabled_for_disk_encryption     = optional(bool)
      enabled_for_template_deployment = optional(bool)
      rbac_authorization_enabled      = optional(bool)
      purge_protection_enabled        = optional(bool)
      public_network_access_enabled   = optional(bool)
      soft_delete_retention_days      = optional(number)

      access_policy = optional(object({

        tenant_id = optional(string)
        object_id = optional(string)

        application_id          = optional(string)
        certificate_permissions = optional(list(string))
        key_permissions         = optional(list(string))
        secret_permissions      = optional(list(string))
        storage_permissions     = optional(list(string))

        }),
      )

      network_acls = optional(object({

        bypass         = string
        default_action = string

        ip_rules                   = optional(list(string))
        virtual_network_subnet_ids = optional(set(string))

        })
      )

      owner       = optional(string)
      co_owner    = optional(string)
      environment = optional(string)

    }
  ))
}


variable "mssql" {

  type = map(object({

    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string

    connection_policy                    = optional(string)
    public_network_access_enabled        = optional(bool)
    outbound_network_restriction_enabled = optional(bool)

    azuread_administrator = optional(object({
      login_username = optional(string)
      object_id      = optional(string)
      tenant_id      = optional(string)
    }))

    identity = optional(object({
      type         = optional(string)
      identity_ids = optional(list(string))
    }))

    tags = optional(map(string))

  }))
}

variable "sql_dbs" {
  type = map(object(
    {
      name       = string
      sku_name   = string
      server_id  = string
      server_key = optional(string)

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

variable "acr" {

  type = map(object(
    {
      name                = string
      resource_group_name = string
      location            = string
      sku                 = string

      admin_enabled                 = optional(bool)
      public_network_access_enabled = optional(bool)
      quarantine_policy_enabled     = optional(bool)
      retention_policy_in_days      = optional(number)
      trust_policy_enabled          = optional(bool)
      zone_redundancy_enabled       = optional(bool)
      export_policy_enabled         = optional(bool)
      anonymous_pull_enabled        = optional(bool)
      data_endpoint_enabled         = optional(bool)
      network_rule_bypass_option    = optional(string)


      georeplications = optional(list(object({

        location                  = string
        regional_endpoint_enabled = optional(bool)
        zone_redundancy_enabled   = optional(bool)

      })))

      network_rule_set = optional(list(object({

        default_action = string

        ip_rule = optional(list(object({
          action   = string
          ip_range = string

        })))
      })))


      identity = optional(object({
        type         = string
        identity_ids = optional(list(string))
      }))

      encryption = optional(object({

        key_vault_key_id   = string
        identity_client_id = string
      }))

      tags = optional(map(string), {})

    }
  ))
}

variable "aks" {

  type = map(object(
    {
      name                = string
      location            = string
      resource_group_name = string
      dns_prefix          = string

      default_node_pool = object({
        name           = string
        vm_size        = string
        node_count     = number
        type           = string

        vnet_subnet_id = optional(string)
        zones                       = optional(list(string))
        enable_auto_scaling         = optional(bool)
        min_count                   = optional(number)
        max_count                   = optional(number)
        max_pods                    = optional(number)
        os_disk_size_gb             = optional(number)
        node_labels                 = optional(map(string))
        node_taints                 = optional(list(string))
        enable_node_public_ip       = optional(bool)
        enable_host_encryption      = optional(bool)
        temporary_name_for_rotation = optional(string)
        orchestrator_version        = optional(string)
      })

      # === Optional Blocks (with nested optional args) ===

      auto_scaler_profile = optional(object({
        balance_similar_node_groups      = optional(bool)
        max_graceful_termination_sec     = optional(string)
        scale_down_delay_after_add       = optional(string)
        scale_down_delay_after_delete    = optional(string)
        scale_down_delay_after_failure   = optional(string)
        scan_interval                    = optional(string)
        scale_down_unneeded              = optional(string)
        scale_down_unready               = optional(string)
        scale_down_utilization_threshold = optional(number)
      }))

      windows_profile = optional(object({
        admin_username = string
        admin_password = string
        license        = optional(string)
      }))

      linux_profile = optional(object({
        admin_username = string
        ssh_key = object({
          key_data = string
        })
      }))

      network_profile = optional(object({
        network_plugin    = string
        load_balancer_sku = optional(string)
        outbound_type     = optional(string)

        # Optional
        network_policy = optional(string)
        dns_service_ip = optional(string)
        service_cidr   = optional(string)
        pod_cidr       = optional(string)

        load_balancer_profile = optional(object({
          managed_outbound_ip_count = optional(number)
          outbound_ip_prefix_ids    = optional(string)
          outbound_ip_address_ids   = optional(string)
          outbound_ports_allocated  = optional(number)
          idle_timeout_in_minutes   = optional(number)
        }))
      }))

      identity = optional(object({

        type         = string
        identity_ids = optional(list(string))
      }))

      azure_active_directory_role_based_access_control = optional(object({
        managed                = optional(bool)
        tenant_id              = optional(string)
        admin_group_object_ids = optional(string)
        azure_rbac_enabled     = optional(bool)
      }))

      service_principal = optional(object({

        client_id     = optional(string)
        client_secret = optional(string)
      }))

      oms_agent = optional(object({
        log_analytics_workspace_id = optional(string)

      }))

      
      storage_profile = optional(object({

        blob_driver_enabled         = optional(bool)
        disk_driver_enabled         = optional(bool)
        file_driver_enabled         = optional(bool)
        snapshot_controller_enabled = optional(bool)

      }))

       aci_connector_linux = optional(object({
      subnet_name = string
    }))

    api_server_access_profile = optional(object({
      authorized_ip_ranges             = optional(list(string))
      virtual_network_integration_enabled = optional(bool)
      subnet_id                        = optional(string)
    }))

    confidential_computing = optional(object({
      sgx_quote_helper_enabled = optional(bool)
    }))

    http_proxy_config = optional(object({

      http_proxy  = optional(string)
      https_proxy = optional(string)
      no_proxy    = optional(list(string))
      trusted_ca  = optional(string)
    }))

    ingress_application_gateway = optional(object({
      gateway_id   = optional(string)
      subnet_cidr  = optional(string)
      subnet_id    = optional(string)
    }))

    key_management_service = optional(object({
      key_vault_key_id         = string
      key_vault_network_access = optional(string, "Public")
    }))

    key_vault_secrets_provider = optional(object({
      secret_rotation_enabled  = optional(bool)
      secret_rotation_interval = optional(string)
    }))

    kubelet_identity = optional(object({
      client_id                 = string
      object_id                 = string
      user_assigned_identity_id = string
    }))



    maintenance_window = optional(object({
      allowed_day     = optional(string)
      allowed_hours   = optional(list(number))
      not_allowed_start = optional(string)
      not_allowed_end   = optional(string)
    }))

    maintenance_window_auto_upgrade = optional(object({
      frequency    = string
      interval     = number
      duration     = number
      day_of_week  = optional(string)
      day_of_month = optional(number)
      week_index   = optional(string)
      start_time   = string
      utc_offset   = optional(string)
      start_date   = optional(string)
    }))

    maintenance_window_node_os = optional(object({
      frequency    = string
      interval     = number
      duration     = number
      day_of_week  = optional(string)
      day_of_month = optional(number)
      week_index   = optional(string)
      start_time   = string
      utc_offset   = optional(string)
      start_date   = optional(string)
    }))

    microsoft_defender = optional(object({
      log_analytics_workspace_id = string
    }))



      dns_prefix_private_cluster          = optional(string)
      automatic_upgrade_channel           = optional(string)
      azure_policy_enabled                = optional(bool)
      cost_analysis_enabled               = optional(bool)
      custom_ca_trust_certificates_base64 = optional(list(string))
      disk_encryption_set_id              = optional(string)
      edge_zone                           = optional(string)
      http_application_routing_enabled    = optional(bool)
      image_cleaner_enabled               = optional(bool)
      image_cleaner_interval_hours        = optional(number)
      kubernetes_version                  = optional(string)
      local_account_disabled              = optional(bool)
      node_os_upgrade_channel             = optional(string)
      node_resource_group                 = optional(string)
      oidc_issuer_enabled                 = optional(bool)
      open_service_mesh_enabled           = optional(bool)
      private_cluster_enabled             = optional(bool)
      private_dns_zone_id                 = optional(string)
      private_cluster_public_fqdn_enabled = optional(bool)
      workload_identity_enabled           = optional(bool)
      role_based_access_control_enabled   = optional(bool)
      run_command_enabled                 = optional(bool)
      sku_tier                            = optional(string)
      support_plan                        = optional(string)
      tags                                = optional(map(string))
  }))
}
