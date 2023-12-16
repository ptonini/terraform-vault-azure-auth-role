variable "role" {}

variable "backend" {}

variable "bound_service_principal_ids" {
  type    = list(string)
  default = []
}

variable "bound_subscription_ids" {
  type    = list(string)
  default = []
}

variable "bound_resource_groups" {
  type    = list(string)
  default = []
}

variable "token_ttl" {
  default = null
}

variable "token_max_ttl" {
  default = null
}

variable "policies" {
  type    = list(string)
  default = []
}

variable "policy_definitions" {
  type    = list(string)
  default = null
}