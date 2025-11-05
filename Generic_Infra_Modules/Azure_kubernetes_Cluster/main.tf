resource "azurerm_kubernetes_cluster" "aks" {

  for_each = var.aks

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  sku_tier                            = each.value.sku_tier
  dns_prefix                          = each.value.dns_prefix
  dns_prefix_private_cluster          = each.value.dns_prefix_private_cluster
  automatic_upgrade_channel           = each.value.automatic_upgrade_channel
  azure_policy_enabled                = each.value.azure_policy_enabled
  cost_analysis_enabled               = each.value.cost_analysis_enabled
  custom_ca_trust_certificates_base64 = each.value.custom_ca_trust_certificates_base64
  disk_encryption_set_id              = each.value.disk_encryption_set_id
  edge_zone                           = each.value.edge_zone
  http_application_routing_enabled    = each.value.http_application_routing_enabled
  image_cleaner_enabled               = each.value.image_cleaner_enabled
  image_cleaner_interval_hours        = each.value.image_cleaner_interval_hours
  kubernetes_version                  = each.value.kubernetes_version
  local_account_disabled              = each.value.local_account_disabled
  node_os_upgrade_channel             = each.value.node_os_upgrade_channel
  node_resource_group                 = each.value.node_resource_group
  oidc_issuer_enabled                 = each.value.oidc_issuer_enabled
  private_cluster_enabled             = each.value.private_cluster_enabled
  private_dns_zone_id                 = each.value.private_dns_zone_id
  workload_identity_enabled           = each.value.workload_identity_enabled
  private_cluster_public_fqdn_enabled = each.value.private_cluster_public_fqdn_enabled
  run_command_enabled                 = each.value.run_command_enabled

  dynamic "default_node_pool" {
    for_each = each.value.default_node_pool != null ? [each.value.default_node_pool] : []

    content {

      name                        = default_node_pool.value.name
      vm_size                     = default_node_pool.value.vm_size
      vnet_subnet_id              = default_node_pool.value.vnet_subnet_id
      zones                       = default_node_pool.value.zones
      node_count                  = default_node_pool.value.node_count
      min_count                   = default_node_pool.value.min_count
      max_count                   = default_node_pool.value.max_count
      max_pods                    = default_node_pool.value.max_pods
      os_disk_size_gb             = default_node_pool.value.os_disk_size_gb
      type                        = default_node_pool.value.type
      orchestrator_version        = default_node_pool.value.orchestrator_version
      temporary_name_for_rotation = default_node_pool.value.temporary_name_for_rotation

    }
  }

  dynamic "windows_profile" {
    for_each = each.value.windows_profile != null ? [each.value.windows_profile] : []

    content {

      admin_username = windows_profile.value.admin_username
      admin_password = windows_profile.value.admin_password

      license = windows_profile.value.license
    }
  }


  dynamic "identity" {

    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "service_principal" {

    for_each = each.value.service_principal != null ? [each.value.service_principal] : []
    content {
      client_id     = service_principal.value.client_id
      client_secret = service_principal.value.client_secret
    }
  }

  dynamic "aci_connector_linux" {
    for_each = each.value.aci_connector_linux != null ? [each.value.aci_connector_linux] : []
    content {
      subnet_name = aci_connector_linux.value.subnet_name
    }
  }
  dynamic "api_server_access_profile" {
    for_each = each.value.api_server_access_profile != null ? [each.value.api_server_access_profile] : []
    content {
      authorized_ip_ranges                = api_server_access_profile.value.authorized_ip_ranges
      virtual_network_integration_enabled = api_server_access_profile.value.virtual_network_integration_enabled
      subnet_id                           = api_server_access_profile.value.subnet_id
    }
  }

  dynamic "auto_scaler_profile" {
    for_each = each.value.auto_scaler_profile != null ? [each.value.auto_scaler_profile] : []

    content {
      balance_similar_node_groups      = auto_scaler_profile.value.balance_similar_node_groups
      expander                         = auto_scaler_profile.value.expander
      max_graceful_termination_sec     = auto_scaler_profile.value.max_graceful_termination_sec
      new_pod_scale_up_delay           = auto_scaler_profile.value.new_pod_scale_up_delay
      scale_down_delay_after_add       = auto_scaler_profile.value.scale_down_delay_after_add
      scale_down_delay_after_delete    = auto_scaler_profile.value.scale_down_delay_after_delete
      scale_down_delay_after_failure   = auto_scaler_profile.value.scale_down_delay_after_failure
      scale_down_unneeded              = auto_scaler_profile.value.scale_down_unneeded
      scale_down_unready               = auto_scaler_profile.value.scale_down_unready
      scale_down_utilization_threshold = auto_scaler_profile.value.scale_down_utilization_threshold
      scan_interval                    = auto_scaler_profile.value.scan_interval
      skip_nodes_with_local_storage    = auto_scaler_profile.value.skip_nodes_with_local_storage
      skip_nodes_with_system_pods      = auto_scaler_profile.value.skip_nodes_with_system_pods
    }
  }

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = each.value.azure_active_directory_role_based_access_control != null ? [each.value.azure_active_directory_role_based_access_control] : []

    content {
      tenant_id              = azure_active_directory_role_based_access_control.value.tenant_id
      admin_group_object_ids = azure_active_directory_role_based_access_control.value.admin_group_object_ids
      azure_rbac_enabled     = azure_active_directory_role_based_access_control.value.azure_rbac_enabled
    }
  }

  dynamic "confidential_computing" {
    for_each = each.value.confidential_computing != null ? [each.value.confidential_computing] : []
    content {
      sgx_quote_helper_enabled = confidential_computing.value.sgx_quote_helper_enabled
    }
  }

  dynamic "http_proxy_config" {
    for_each = each.value.http_proxy_config != null ? [each.value.http_proxy_config] : []
    content {
      http_proxy  = http_proxy_config.value.http_proxy
      https_proxy = http_proxy_config.value.https_proxy
      no_proxy    = http_proxy_config.value.no_proxy
      trusted_ca  = http_proxy_config.value.trusted_ca
    }
  }

  dynamic "ingress_application_gateway" {
    for_each = each.value.ingress_application_gateway != null ? [each.value.ingress_application_gateway] : []
    content {
      gateway_id  = ingress_application_gateway.value.gateway_id
      subnet_cidr = ingress_application_gateway.value.subnet_cidr
      subnet_id   = ingress_application_gateway.value.subnet_id
    }
  }

  dynamic "key_management_service" {
    for_each = each.value.key_management_service != null ? [each.value.key_management_service] : []
    
    content {
      key_vault_key_id         = key_management_service.value.key_vault_key_id
      key_vault_network_access = key_management_service.value.key_vault_network_access
    }
  }

  dynamic "key_vault_secrets_provider" {
    for_each = each.value.key_vault_secrets_provider != null ? [each.value.key_vault_secrets_provider] : []
    content {
      secret_rotation_enabled  = key_vault_secrets_provider.value.secret_rotation_enabled
      secret_rotation_interval = key_vault_secrets_provider.value.secret_rotation_interval
    }
  }

  dynamic "kubelet_identity" {
    for_each = each.value.kubelet_identity != null ? [each.value.kubelet_identity] : []
    content {
      client_id                 = kubelet_identity.value.client_id
      object_id                 = kubelet_identity.value.object_id
      user_assigned_identity_id = kubelet_identity.value.user_assigned_identity_id
    }
  }

  dynamic "linux_profile" {
    for_each = each.value.linux_profile != null ? [each.value.linux_profile] : []
    content {
      admin_username = linux_profile.value.admin_username
      ssh_key {
        key_data = linux_profile.value.ssh_public_key
      }
    }
  }

  dynamic "maintenance_window" {
    for_each = each.value.maintenance_window != null ? [each.value.maintenance_window] : []
    content {

      allowed {
        day   = maintenance_window.value.allowed_day
        hours = maintenance_window.value.allowed_hours
      }
      not_allowed {
        start = maintenance_window.value.not_allowed_start
        end   = maintenance_window.value.not_allowed_end
      }
    }
  }
  dynamic "maintenance_window_auto_upgrade" {
    for_each = each.value.maintenance_window_auto_upgrade != null ? [each.value.maintenance_window_auto_upgrade] : []
    content {
      frequency    = maintenance_window_auto_upgrade.value.frequency
      interval     = maintenance_window_auto_upgrade.value.interval
      duration     = maintenance_window_auto_upgrade.value.duration
      day_of_week  = maintenance_window_auto_upgrade.value.day_of_week
      day_of_month = maintenance_window_auto_upgrade.value.day_of_month
      week_index   = maintenance_window_auto_upgrade.value.week_index
      start_time   = maintenance_window_auto_upgrade.value.start_time
      utc_offset   = maintenance_window_auto_upgrade.value.utc_offset
      start_date   = maintenance_window_auto_upgrade.value.start_date
    }
  }

  dynamic "maintenance_window_node_os" {
    for_each = each.value.maintenance_window_node_os != null ? [each.value.maintenance_window_node_os] : []
    content {
      frequency    = maintenance_window_node_os.value.frequency
      interval     = maintenance_window_node_os.value.interval
      duration     = maintenance_window_node_os.value.duration
      day_of_week  = maintenance_window_node_os.value.day_of_week
      day_of_month = maintenance_window_node_os.value.day_of_month
      week_index   = maintenance_window_node_os.value.week_index
      start_time   = maintenance_window_node_os.value.start_time
      utc_offset   = maintenance_window_node_os.value.utc_offset
      start_date   = maintenance_window_node_os.value.start_date
    }
  }

  dynamic "microsoft_defender" {
    
    for_each = each.value.microsoft_defender != null ? [each.value.microsoft_defender] : []
    content {
      log_analytics_workspace_id = microsoft_defender.value.log_analytics_workspace_id
    }
  }

  dynamic "network_profile" {
    for_each = each.value.network_profile != null ? [each.value.network_profile] : []
    content {
      network_plugin    = network_profile.value.network_plugin
      network_policy    = network_profile.value.network_policy
      dns_service_ip    = network_profile.value.dns_service_ip
      service_cidr      = network_profile.value.service_cidr
      outbound_type     = network_profile.value.outbound_type
      pod_cidr          = network_profile.value.pod_cidr
      load_balancer_sku = network_profile.value.load_balancer_sku
    }
  }
  dynamic "storage_profile" {

    for_each = each.value.storage_profile != null ? [each.value.storage_profile] : []
    content {
      blob_driver_enabled         = storage_profile.value.blob_driver_enabled
      disk_driver_enabled         = storage_profile.value.disk_driver_enabled
      file_driver_enabled         = storage_profile.value.file_driver_enabled
      snapshot_controller_enabled = storage_profile.value.snapshot_controller_enabled
    }
  }
  
  tags = each.value.tags

}
