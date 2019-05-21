resource "google_sql_database_instance" "master" {
  name             = "sampledb"
  database_version = "MYSQL_5_7"
  region           = "${var.region}"

  settings {
    tier      = "db-n1-standard-4"
    disk_type = "PD_SSD"
    disk_size = "1000"

    backup_configuration {
      enabled            = "true"
      binary_log_enabled = "true"
      start_time         = "02:30"
    }
    ip_configuration {
      ipv4_enabled = "true"
      authorized_networks  {
        value = "${google_compute_instance.web01.network_interface.0.access_config.0.assigned_nat_ip}"
      }
    }
  }
}

/*
resource "google_sql_database" "database" {
  name      = "users-db"
  instance  = "${google_sql_database_instance.master.name}"
  charset   = "sjis"
  collation = "sjis_japanese_ci"
}
*/
resource "google_sql_user" "users" {
  name     = "admin_user"
  instance = "${google_sql_database_instance.master.name}"
  host     = "%"
  password = "admin_user1234"
}
