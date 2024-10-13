terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
    }
  }
}

provider "snowflake" {
  alias = "sys_admin"
  role = "SYSADMIN"
}

resource "snowflake_database" "SF_DEMO" {
  provider = snowflake.sys_admin
  name = "SF_DEMO"
}

resource "snowflake_database" "CUSTOM_DB" {
  name = "CUSTOM_DB"
}

resource "snowflake_schema" "schema" {
  name = "CUSTOM_SCHEMA"
  database = "${snowflake_database.database.name}"
}