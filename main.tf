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


resource "snowflake_account_role" "complete" {
  provider = snowflake.sys_admin
  name    = "role_name"
  comment = "my account role"
}