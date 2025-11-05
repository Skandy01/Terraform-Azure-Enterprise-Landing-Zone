variable "aks" {

  type = map(object(

    {

      name                = string
      location            = string
      resource_group_name = string
      dns_prefix          = string

      default_node_pool = object({

        name                        = string
        vm_size                     = string
        vnet_subnet_id              = string
        zones                       = list(string)
        node_count                  = number
        enable_auto_scaling         = bool
        min_count                   = number
        max_count                   = number
        max_pods                    = number
        os_disk_size_gb             = number
        type                        = string
        node_labels                 = map(string)
        node_taints                 = list(string)
        enable_node_public_ip       = bool
        enable_host_encryption      = optional(bool)
        temporary_name_for_rotation = optional(string)
        orchestrator_version        = optional(string)
      })

      auto_scaler_profile = object({

        balance_similar_node_groups      = string
        max_graceful_termination_sec     = string
        scale_down_delay_after_add       = string
        scale_down_delay_after_delete    = string
        scale_down_delay_after_failure   = string
        scan_interval                    = string
        scale_down_unneeded              = string
        scale_down_unready               = string
        scale_down_utilization_threshold = string

      })

      windows_profile = object({

        admin_username = string
        admin_password = string
        license        = string

      })

      linux_profile = object({

        admin_username = string

        ssh_key = object({
          key_data = string
        })

      })

      network_profile = object({

        network_plugin    = string
        network_policy    = string
        dns_service_ip    = string
        outbound_type     = string
        pod_cidr          = string
        service_cidr      = string
        load_balancer_sku = string
        load_balancer_profile = object({
          outbound_ports_allocated  = string
          idle_timeout_in_minutes   = string
          managed_outbound_ip_count = string
          outbound_ip_address_ids   = string
          outbound_ip_prefix_ids    = string

        })

      })

      identity = object({

        type = string
        identity_ids = list(string)

      })

      azure_active_directory_role_based_access_control = object({

        tenant_id = string

        admin_group_object_ids = string

      })

      service_principal = object({

        client_id = string

        client_secret = string

      })

      oms_agent = object({

        log_analytics_workspace_id = string

      })

      storage_profile = object({

        blob_driver_enabled         = bool
        disk_driver_enabled         = bool
        file_driver_enabled         = bool
        snapshot_controller_enabled = bool

      })

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


      dns_prefix_private_cluster = string

      automatic_upgrade_channel = string

      azure_policy_enabled = bool

      cost_analysis_enabled = bool

      custom_ca_trust_certificates_base64 = list(string)

      disk_encryption_set_id = string

      edge_zone = string

      http_application_routing_enabled = bool

      image_cleaner_enabled = bool

      image_cleaner_interval_hours = number

      kubernetes_version = string

      local_account_disabled = bool

      node_os_upgrade_channel = string

      node_resource_group = string

      oidc_issuer_enabled = bool

      open_service_mesh_enabled = bool

      private_cluster_enabled = bool

      private_dns_zone_id = string

      private_cluster_public_fqdn_enabled = bool

      workload_identity_enabled = bool

      role_based_access_control_enabled = bool

      run_command_enabled = bool

      sku_tier = string

      support_plan = string

      tags = map(string)

    }

  ))

}
 
