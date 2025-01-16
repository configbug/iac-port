variable "port_client_id" {
  # default     = "value"
  description = "The client ID for the Port API"
  type        = string
  sensitive   = false
}

variable "port_client_secret" {
  # default     = "value"
  description = "Value of the client secret"
  type        = string
  sensitive   = true
}

# variable "subscription_id" {
#   description = "Azure Subscription ID"
#   type        = string
# }