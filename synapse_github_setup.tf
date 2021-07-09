
provider "azurerm" {
features {}
}

resource "azurerm_resource_group" "synapse-experiments-rg" {
  name     = "synapse-git-config-rg"
  location = "UK South"
}

resource "azurerm_storage_account" "synapse-experiments-sa" {
  name                     = "synapseprimarysa"
  resource_group_name      = azurerm_resource_group.synapse-experiments-rg.name
  location                 = azurerm_resource_group.synapse-experiments-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "synapse-experiments-fs" {
  name               = "synapseprimaryfs"
  storage_account_id = azurerm_storage_account.synapse-experiments-sa.id
}

resource "azurerm_synapse_workspace" "synapse-experiments-ws" {
  name                                 = "synapsegitconfigws"
  resource_group_name                  = azurerm_resource_group.synapse-experiments-rg.name
  location                             = azurerm_resource_group.synapse-experiments-rg.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.synapse-experiments-fs.id
  sql_administrator_login              = "sqladminuser"
  sql_administrator_login_password     = "Password_123"

  github_repo {
      account_name = "ajith-ramanath"
      branch_name = "dev"
      repository_name = "SynapseExperiments"
      root_folder = "/"
  }

  tags = {
    Env = "development"
  }
}