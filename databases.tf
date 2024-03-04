resource "vault_database_secrets_mount" "databases" {
  path = "db"

  mongodb {
    name           = "db1"
    connection_url = "mongodb://{{username}}:{{password}}@mongodb:27017/"
    username       = "root"
    password       = "dummy_secret_testpw"
    allowed_roles  = [
      "role1"
    ]
  }
}

resource "vault_database_secret_backend_connection" "db2" {
  backend = vault_database_secrets_mount.databases.path
  name    = "db2"
  mongodb {
    connection_url = "mongodb://{{username}}:{{password}}@mongodb:27017/"
    username       = "root"
    password       = "dummy_secret_testpw"
  }
  allowed_roles  = [
    "role2"
  ]
}


resource "vault_database_secret_backend_static_role" "role1" {
  name              = "role1"
  backend           = vault_database_secrets_mount.databases.path
  db_name           = vault_database_secrets_mount.databases.mongodb[0].name
  username          = "mongo1"
  rotation_schedule = "0 1 * * *"
}


resource "vault_database_secret_backend_static_role" "role2" {
  name              = "role2"
  backend           = vault_database_secrets_mount.databases.path
  db_name           = vault_database_secret_backend_connection.db2.name
  username          = "mongo2"
  rotation_schedule = "0 1 * * *"
}