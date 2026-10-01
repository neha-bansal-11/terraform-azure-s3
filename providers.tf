provider "azurerm" {
  subscription_id = "0997463b-64ca-4371-b5c9-78562b6f6044"
  client_id = "475c4b36-4798-415c-a349-2bd3b692c5ca"
  client_secret = "15C8Q~oUoBCWB4EJ4MfUvtgLl64933_i~RzBLdnz"
  tenant_id = "56f775a3-2540-4f05-ab58-72cd72d17d3e"
  #oidc_token = var.oidc_token
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}


terraform {
  #required_version = "~>1.11.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}
