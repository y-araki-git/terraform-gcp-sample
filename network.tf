resource "google_compute_network" "network" {
  name = "network"
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet1"
  ip_cidr_range = "xxx.xxx.xxx.xxx/xx"
  network       = "${google_compute_network.network.name}"
  description   = "network"
  region        = "${var.region}"
}
