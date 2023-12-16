resource "vault_policy" "this" {
  count = var.policy_definitions == null ? 0 : 1
  name   = "azure-auth-${var.role}"
  policy = join("\n\n", var.policy_definitions)
}

resource "vault_azure_auth_backend_role" "this" {
  backend                     = try(var.backend.path, var.backend)
  role                        = var.role
  bound_service_principal_ids = var.bound_service_principal_ids
  bound_subscription_ids      = var.bound_subscription_ids
  bound_resource_groups       = var.bound_resource_groups
  token_ttl                   = var.token_ttl
  token_max_ttl               = var.token_max_ttl
  token_policies              = concat(vault_policy.this[*].name, var.policies)
}