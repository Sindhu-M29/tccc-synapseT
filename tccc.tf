provider "azurerm" {
  features {}

///////////Service principle details
}
data "azurerm_client_config" "sub-id" {}

resource "azurerm_resource_group" "RG" {
  name     = var.resource_group_name
  location = "centralindia"
}

//resource "azurerm_data_factory" "DataFactory" {
  //name                = var.data_factory_name
  //location = "centralindia"
  //resource_group_name = azurerm_resource_group.RG.name

  //identity {
    //type = "SystemAssigned"
  //}
//}

//resource "azurerm_databricks_workspace" "Databricks" {
  //location = "centralindia"
  //name                          = var.databricks_name
  //resource_group_name           = azurerm_resource_group.RG.name
  #managed_resource_group_name   = var.databricks_managed_resource_group_name
  //sku                           = var.databricks_sku
//}

resource "azurerm_storage_account" "DataLake" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.RG.name
  location = "centralindia"
  account_tier             = var.storage_account_tier
  account_replication_type = "LRS"
  is_hns_enabled           = true
  min_tls_version          = "TLS1_2"

  network_rules {
    default_action = "Allow"
  }
}

resource "azurerm_storage_container" "DataLakeContainer" {  
  for_each              = var.data_lake_containers
  name                  = each.key
  storage_account_name  = azurerm_storage_account.DataLake.name
  container_access_type = "private"  # Consider using "private" for better security
}

//resource "azurerm_mssql_server" "SQLServer" {
  //name                         = var.sql_server_name
  //resource_group_name          = azurerm_resource_group.RG.name
  //location = "centralindia"
  //version                      = var.sql_server_version
  //administrator_login          = var.sql_admin_username
  //administrator_login_password = random_string.SQLAdminPassword.result

//}

//resource "azurerm_mssql_database" "SQLDatabase" {
  //name           = var.sql_database_name
  //server_id      = azurerm_mssql_server.SQLServer.id
  
  //max_size_gb    = var.sql_database_max_size_gb

//}

//resource "random_string" "SQLAdminPassword" {
  //length  = 16
  //special = true
//}
resource "azurerm_synapse_workspace" "synapse-ws" {
  name                                 = "synapse-ws"
  resource_group_name                  = azurerm_resource_group.RG.name
  location                             = azurerm_resource_group.RG.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_container.DataLakeContainer["data"].id
  sql_administrator_login              = "sqladminuser"
  sql_administrator_login_password     = "H@Sh1CoR3!"

  identity {
    type = "SystemAssigned"
  }
}
