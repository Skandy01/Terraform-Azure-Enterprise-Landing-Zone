variable "mssql" {
  
  type = map(object(
    {
        name = string
        resource_group_name = string
        location = string
        version = string
        administrator_login = string
        administrator_login_password = string
        minimum_tls_version = string

        connection_policy = optional(string)
        public_network_access_enabled = optional(bool)
        outbound_network_restriction_enabled = optional(bool)

        azuread_administrator = optional(object({

            login_username = optional(string)
            object_id = optional(string)
            tenant_id = optional(string)
        }))

        identity = optional(object(
            {
                type = optional(string)
                identity_ids = optional(list(string))
            }
        ))

        tags = optional(map(string))     

    }
  ))
}