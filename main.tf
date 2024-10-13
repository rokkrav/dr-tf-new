terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
    }
  }
}

provider "snowflake" {
 # alias = "sys_admin"
 # role = "SYSADMIN"

  alias = "acc_admin"
  role = "ACCOUNTADMIN"
}


resource "snowflake_user" "test_user" {
  provider = snowflake.acc_admin
  name  = "dr_user"
  login_name = "dr_user"
  default_role = "SYSADMIN"
}


resource "snowflake_account_role" "complete" {
  provider = snowflake.acc_admin
  name    = "dr_role"
  comment = "my account role"
}
