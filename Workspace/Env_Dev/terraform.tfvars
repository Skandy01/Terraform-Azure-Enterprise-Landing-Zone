
RGs = {

  RG1 = {

    rg_name  = "resource-group-1"
    location = "East US"
    tags = {
      owner    = "Pranju"
      co_owner = "Vishy"
    }
  }
  RG2 = {
    rg_name  = "resource-group-2"
    location = "West US"
    tags = {
      owner = "Vishy"
    }
  }
}

stgs = {

  STG1 = {

    name                          = "stg1"
    location                      = "East US"
    rg_name                       = "resource-group-1"
    account_tier                  = "Standard"
    account_replication_type      = "LRS"
    access_tier                   = "Hot"
    https_traffic_only_enabled    = true
    min_tls_version               = "TLS1_0"
    shared_access_key_enabled     = true
    public_network_access_enabled = true
    is_hns_enabled                = true
    allowed_copy_scope            = "AAD"
    dns_endpoint_type             = "Standard"

    owner         = "Gg"
    co_owner      = "Vishy"
    business_unit = "12"

  }

  STG2 = {
    name                          = "stg2"
    location                      = "East US"
    rg_name                       = "resource-group-2"
    account_tier                  = "Standard"
    account_replication_type      = "LRS"
    access_tier                   = "Hot"
    https_traffic_only_enabled    = true
    min_tls_version               = "TLS1_0"
    shared_access_key_enabled     = true
    public_network_access_enabled = true
    is_hns_enabled                = true
    allowed_copy_scope            = "AAD"
    dns_endpoint_type             = "Standard"

    owner    = "Vishy"
    co_owner = "Gg"

  }
}

vnets = {

  vnet1 = {

    name                           = "vnet1"
    location                       = "East US"
    rg_name                        = "resource-group-1"
    address_space                  = ["10.0.0.0"]
    flow_timeout_in_minutes        = 10
    private_endpoint_vnet_policies = "Basic"
    owner                          = "vishy"
    buisness_unit                  = "12"

  }

  vnet2 = {

    name                           = "vnet2"
    location                       = "East US"
    rg_name                        = "resource-group-2"
    address_space                  = ["10.0.0.1"]
    flow_timeout_in_minutes        = 7
    edge_zone                      = null
    private_endpoint_vnet_policies = "Basic"
    owner                          = "vishy"
    co_owner                       = "Gg"
  }
}

subnets = {

  subnet1 = {

    subnet_name                                   = "subnet1"
    virtual_network_name                          = "vnet1"
    resource_group_name                           = "resource-group-1"
    address_prefixes                              = ["10.0.0.0/24"]
    default_outbound_access_enabled               = true
    private_endpoint_network_policies             = "NetworkSecurityGroupEnabled"
    private_link_service_network_policies_enabled = true
    service_endpoints                             = ["Microsoft.Sql"]

  }

  subnet3 = {

    subnet_name                                   = "AzureBastionSubnet"
    virtual_network_name                          = "vnet1"
    resource_group_name                           = "resource-group-1"
    address_prefixes                              = ["10.0.1.0/24"]
    default_outbound_access_enabled               = true
    private_endpoint_network_policies             = "NetworkSecurityGroupEnabled"
    private_link_service_network_policies_enabled = true
    service_endpoints                             = ["Microsoft.Sql"]
  }


  subnet2 = {

    subnet_name                                   = "subnet2"
    virtual_network_name                          = "vnet2"
    resource_group_name                           = "resource-group-2"
    address_prefixes                              = ["10.0.0.0/24"]
    default_outbound_access_enabled               = true
    private_link_service_network_policies_enabled = true

  }

}


pips = {

  pip1 = {

    name                 = "public_ip_1"
    resource_group_name  = "resource-group-1"
    location             = "East US"
    allocation_method    = "Static"
    zones                = ["1", "2", "3"]
    ddos_protection_mode = "VirtualNetworkInherited"
    ip_version           = "IPv4"
    sku                  = "Standard"
    sku_tier             = "Regional"

    environment = "Production"
    owner       = "Vishy"

  }

  pip2 = {

    name                = "public_ip_2"
    resource_group_name = "resource-group-2"
    location            = "East US"
    allocation_method   = "Static"
    ip_version          = "IPv4"
    sku                 = "Standard"

    environment = "Production"
    co_owner    = "Vishy"

  }

  pip3 = {

    name                = "public_ip_3"
    resource_group_name = "resource-group-2"
    location            = "East US"
    allocation_method   = "Static"
    ip_version          = "IPv4"
    sku                 = "Standard"

    environment = "Production"
    co_owner    = "Vishy"

  }
}

bastions = {

  bastion1 = {

    name                = "my_first_bastion"
    resource_group_name = "resource-group-1"
    location            = "East US"
    copy_paste_enabled  = true
    sku                 = "Standard"
    kerberos_enabled    = false
    scale_units         = 2
    owner               = "Vishy"
    environment         = "Production"

    ip_configuration = {

      name                 = "ip_config_1"
      subnet_id            = ""
      public_ip_address_id = ""

      subnet_key = "subnet3"
      public_key = "pip1"

    }

  }


  bastion2 = {

    name                = "my_second_bastion"
    resource_group_name = "resource-group-2"
    location            = "East US"
    copy_paste_enabled  = true
    sku                 = "Standard"
    kerberos_enabled    = false
    scale_units         = 2
    owner               = "Vishy"
    environment         = "Production"

    ip_configuration = {

      name                 = "ip_config_2"
      subnet_id            = ""
      public_ip_address_id = ""

      subnet_key = "subnet3"
      public_key = "pip2"

    }

  }
}

nics = {

  nic1 = {

    name                = "nic-1"
    location            = "East US"
    resource_group_name = "resource-group-1"

    ip_configuration = {

      name                          = "ip_config_1"
      private_ip_address_allocation = "Dynamic"
      private_ip_address_version    = "IPv4"

      subnet_id            = ""
      public_ip_address_id = ""

      subnet_key = "subnet1"
      public_key = "pip3"

      gateway_load_balancer_frontend_ip_configuration_id = null
      primary                                            = true

      # load_balancer_backend_address_pools_ids          = optional(list(string))
      # load_balancer_inbound_nat_rules_ids              = optional(list(string))

    }

    owner       = "Vishy"
    co_owner    = "Gg"
    environment = "Production"
  }


  nic2 = {

    name                = "nic-2"
    location            = "East US"
    resource_group_name = "resource-group-2"

    ip_configuration = {

      name                          = "ip_config_2"
      private_ip_address_allocation = "Dynamic"
      private_ip_address_version    = "IPv4"

      subnet_id            = ""
      public_ip_address_id = ""

      subnet_key = "subnet2"
      public_key = "pip3"

      gateway_load_balancer_frontend_ip_configuration_id = null
      primary                                            = true

      # load_balancer_backend_address_pools_ids          = optional(list(string))
      # load_balancer_inbound_nat_rules_ids              = optional(list(string))

    }

    owner       = "Vishy"
    co_owner    = "Gg"
    environment = "Production"
  }
}

vms = {

  "vm1" = {

    name                = "vm1"
    resource_group_name = "resource-group-1"
    location            = "East US"
    size                = "Standard_B1s"

    network_interface_ids = [""]
    nic_key               = "nic1"

    admin_username                  = "azureuser"
    admin_password                  = "P@ssw0rd1234"
    disable_password_authentication = false

    os_disk = {

      name = "myvm-osdisk"

      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {

      offer     = "UbuntuServer"
      publisher = "Canonical"
      sku       = "18.04-LTS"
      version   = "latest"

    }

    co_owner    = "Gg"
    environment = "Production"

  }

  "vm2" = {

    name                = "vm2"
    resource_group_name = "resource-group-2"
    location            = "East US"
    size                = "Standard_B1s"

    network_interface_ids = [""]
    nic_key               = "nic2"

    admin_username                  = "azureuser"
    admin_password                  = "P@ssw0rd1234"
    disable_password_authentication = false

    os_disk = {

      name                 = "myvm-osdisk"
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {

      offer     = "UbuntuServer"
      publisher = "Canonical"
      sku       = "18.04-LTS"
      version   = "latest"

    }

    co_owner    = "Gg"
    environment = "Production"

  }

}

key_vault = {

  "key_vault1" = {

    name                = "my-key-vault"
    location            = "East US"
    resource_group_name = "resource-group-1"
    sku_name            = "standard"
    tenant_id           = "f5031c5a-41d8-4639-bc25-2643f12dc493"

    public_network_access_enabled = "true"
    soft_delete_retention_days    = 7

    network_acls = {

      bypass         = "AzureServices"
      default_action = "Deny"
    }

    owner       = "Vishy"
    co_owner    = "Gg"
    environment = "Production"

  }

  "key_vault2" = {

    name                = "my-key-vault-2"
    location            = "East US"
    resource_group_name = "resource-group-2"
    sku_name            = "standard"
    tenant_id           = "f5031c5a-41d8-4639-bc25-2643f12dc493"

    public_network_access_enabled = "true"
    soft_delete_retention_days    = 7

    network_acls = {

      bypass         = "AzureServices"
      default_action = "Deny"
    }

    co_owner    = "Gg"
    environment = "Production"

  }
}

mssql = {

  "mssql_1" = {

    name                         = "mysql1"
    resource_group_name          = "resource-group-1"
    location                     = "East US"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "SuperSecretPass123!"
    minimum_tls_version          = "1.2"

    public_network_access_enabled        = true
    outbound_network_restriction_enabled = false

    identity = {
      type         = "SystemAssigned"
      identity_ids = []
    }

    tags = {
      owner       = "Vishy"
      environment = "Production"
    }
  }

  "mssql_2" = {

    name                         = "mysql2"
    resource_group_name          = "resource-group-2"
    location                     = "East US"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "SuperSecretPass123!"
    minimum_tls_version          = "1.2"

    public_network_access_enabled        = true
    outbound_network_restriction_enabled = false

    identity = {
      type         = "SystemAssigned"
      identity_ids = []
    }

    tags = {
      owner       = "Vishy"
      environment = "Production"
    }
  }
}

sql_dbs = {

  "webapp_db" = {

    name       = "webapp-db"
    sku_name   = "S1"
    server_id  = ""
    server_key = "mssql_1"

    max_size_gb    = 100
    collation      = "SQL_Latin1_General_CP1_CS_AS"
    zone_redundant = true
    read_scale     = false

    threat_detection_policy = {

      state                = "Enabled"
      email_account_admins = "Disabled"
      email_addresses      = ["admin@company.com", "devops@company.com"]
      retention_days       = 30

    }

    # identity = {

    #   type = "UserAssigned"
    # }

    tags = {

      environment = "Production"
      app         = "WebApp"
    }
  }

  "analytics_db" = {

    name       = "analytics-db"
    sku_name   = "GP_Gen5_2"
    server_id  = ""
    server_key = "mssql_1"

    # Optional Arguments (minimal)
    max_size_gb = 500

    tags = {
      environment = "Production"
      app         = "Analytics"
    }
  }

}

acr = {
  "acr1" = {

    name                = "myacrprod001"
    resource_group_name = "resource-group-1"
    location            = "East US"
    sku                 = "Premium"


    admin_enabled                 = true
    public_network_access_enabled = false
    zone_redundancy_enabled       = true
    quarantine_policy_enabled     = true
    network_rule_bypass_option    = "AzureServices"


    tags = {
      owner       = "Vishy"
      environment = "Production"
    }

    network_rule_set = [{
      default_action = "Deny"

      ip_rule = [{
        action   = "Allow"
        ip_range = "203.0.113.50/32"
      }]
    }]

    georeplications = [{
      location                  = "West US"
      zone_redundancy_enabled   = true
      regional_endpoint_enabled = true
    }]
  }

   "acr2" = {

    name                = "myacrprod002"
    resource_group_name = "resource-group-2"
    location            = "East US"
    sku                 = "Premium"


    admin_enabled                 = true
    public_network_access_enabled = false
    zone_redundancy_enabled       = true
    quarantine_policy_enabled     = true
    network_rule_bypass_option    = "AzureServices"


    tags = {
      owner       = "Vishy"
      environment = "Production"
    }

    network_rule_set = [{
      default_action = "Deny"

      ip_rule = [{
        action   = "Allow"
        ip_range = "203.0.113.50/32"
      }]
    }]

    georeplications = [{
      location                  = "West US"
      zone_redundancy_enabled   = true
      regional_endpoint_enabled = true
    }]
  }
}

aks = {

  cluster1 = {

    name           = "cluster1"
    location           = "East US"
    resource_group_name            = "resource-group-1"
    dns_prefix         = "cluster1x"
    kubernetes_version = "1.27"
 
    default_node_pool = {
      name  = "nodepool1"
      node_count      = 2
      vm_size         = "Standard_D2s_v3"
      os_disk_size_gb = 30
      type            = "VirtualMachineScaleSets"
      max_pods        = 30
    }

    identity = {
      type = "SystemAssigned"
    }
 
    network_profile = {
      network_plugin     = "azure"
      service_cidr       = "10.0.0.0/16"
      dns_service_ip     = "10.0.0.10"
      docker_bridge_cidr = "172.17.0.1/16"
    }
  }
 
  cluster2 = {
    name           = "cluster2"
    location           = "East US"
    resource_group_name            = "resource-group-2"
    dns_prefix         = "cluster2x"
    kubernetes_version = "1.27"
 
    default_node_pool = {

      name  = "nodepool2"
      node_count      = 2
      vm_size         = "Standard_D2s_v3"
      os_disk_size_gb = 30
      type            = "VirtualMachineScaleSets"
      max_pods        = 30
    }
 
    network_profile = {
      network_plugin     = "azure"
      service_cidr       = "10.0.0.0/16"
      dns_service_ip     = "10.0.0.10"
      docker_bridge_cidr = "172.17.0.1/16"
    }

    identity = {
      type = "SystemAssigned"
    }
  }
}