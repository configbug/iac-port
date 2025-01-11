terraform {
  required_providers {
    port = {
      source  = "port-labs/port-labs"
      version = "~> 2.1.3"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }
  }
}

provider "port" {
  client_id = var.port_client_id
  secret    = var.port_client_secret
  base_url  = "https://api.getport.io"
}
