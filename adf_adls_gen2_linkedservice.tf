data "azurerm_client_config" "current" {
}

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "adf_adlsg2_linkedservice" {
  name                  = "adlsgen2_linked_service"
  resource_group_name   = azurerm_resource_group.synapse-experiments-rg.name
  data_factory_name     = azurerm_data_factory.azure-data-factory.name
  service_principal_id  = data.azurerm_client_config.current.client_id
  service_principal_key = "exampleKey"
  tenant                = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx"
  url                   = "https://synapseprimarysa.dfs.core.windows.net/"
}