variable "resource_group_name" {
  description = "terra-tccc"
  type        = string
}

#variable "resource_group_location" {
 # description = "eastus"
  #type        = string
#}

//variable "data_factory_name" {
  //description = "df-tccc"
  //type        = string
//}

//variable "databricks_name" {
  //description = "Databrickswk"
  //type        = string
//}

#variable "databricks_managed_resource_group_name" {
 # description = "terra-tccc"
  #type        = string
#}

//variable "databricks_sku" {
  //description = "SKU for Databricks workspace"
  //type        = string
  //default     = "standard"  # Change this to either "standard", "premium", or "trial"
//}


variable "storage_account_name" {
  description = "sind345"
  type        = string
}

variable "storage_account_tier" {
  description = "Tier for the storage account"
  type        = string
  default     = "Standard"  # Use either "Standard" or "Premium"
}


#variable "storage_account_replication" {
 # description = "LRS"
  #type        = string
#}

variable "data_lake_containers" {
  description = "tccc-cont"
  type        = map(string)
  default     = {
    data = "Main container for storing all data"
  }
}


//variable "sql_server_name" {
  //description = "sqltccc"
  //type        = string
//}


//variable "sql_server_version" {
  //description = "Version of the SQL Server"
  //type        = string
  //default     = "12.0"
//}


//variable "sql_admin_username" {
  //description = "Sindhu"
  //type        = string
//}



//variable "sql_database_name" {
  //description = "tcccdb"
  //type        = string
//}

//variable "sql_database_max_size_gb" {
  //description = "Max size of SQL Database in GB."
  //type        = number
  //default     = 2
//}



