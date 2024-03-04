terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.25.0"
    }
  }
}

provider "vault" {
  address = "http://127.0.0.1:8200"
}
