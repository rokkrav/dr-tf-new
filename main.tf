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


resource "snowflake_user" "test_user" {
  provider = snowflake.sys_admin
  name  = "test_user"
  login_name = "test_user"
  default_role = "SYSADMIN"
}

resource "snowflake_role" "example_role" {
  provider = snowflake.sys_admin
  name = "example_role"
}

resource "snowflake_database" "dr_database" {
  provider = snowflake.sys_admin
  name = "dr_database"
}

resource "snowflake_schema" "dr_schema" {
  provider = snowflake.sys_admin
  name = "dr_schema"
  database = snowflake_database.dr_database.name
}