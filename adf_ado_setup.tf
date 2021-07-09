resource "azurerm_data_factory" "azure-data-factory" {
  name                = "adf-experiments-workspace"
  location            = azurerm_resource_group.synapse-experiments-rg.location
  resource_group_name = azurerm_resource_group.synapse-experiments-rg.name

  vsts_configuration {
    account_name = "aramanath0065"
    branch_name = "dev"
    project_name = "SynapseExperiments"
    repository_name = "SynapseExperiments"
    root_folder = "/"
    tenant_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx"
  }

}