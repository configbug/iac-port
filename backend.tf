terraform {
  cloud {
    organization = "configbug-org"

    workspaces {
      name = "iac-port"
    }
  }
}