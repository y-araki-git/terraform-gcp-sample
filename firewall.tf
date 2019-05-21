resource "google_compute_firewall" "allow-icmp" {
  name    = "allow-icmp"
  network = "${google_compute_network.network.name}"

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-tcp-XXXX" {
  name    = "allow-from-XXX"
  network = "${google_compute_network.network.name}"

  allow {
    protocol = "tcp"
    ports    = ["2201"]
  }

  source_ranges = ["xxx.xxx.xxx.xxx/32","xxx.xxx.xxx.xxx/32"]
}

resource "google_compute_firewall" "allow-tcp-prometheus" {
  name    = "allow-from-prometheus"
  network = "${google_compute_network.network.name}"

  allow {
    protocol = "tcp"
    ports    = ["XXXX"]
  }

  allow {
    protocol = "tcp"
    ports    = ["XXXX"]
  }

  allow {
    protocol = "tcp"
    ports    = ["XXXX"]
  }

  allow {
    protocol = "tcp"
    ports    = ["XXXX"]
  }

  source_ranges = ["xxx.xxx.xxx.xxx/32"]
}

resource "google_compute_firewall" "allow-internal" {
  name    = "allow-internal"
  network = "${google_compute_network.network.name}"

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["xxx.xxx.xxx.xxx/24"]
}

/*
resource "google_compute_firewall" "allow-internal-lb" {
  name    = "allow-internal-lb"
  network = "${google_compute_network.network.name}"
  allow {
    protocol = "tcp"
    ports    = ["xxxxxx"]
  }
  source_ranges = ["xxx.xxx.xxx.xxx/20"]
  target_tags = ["kvs"]
}
 
resource "google_compute_firewall" "allow-health-check" {
  name    = "allow-health-check"
  network = "${google_compute_network.network.name}"
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  source_ranges = ["xxx.xxx.xxx.xxx/16","xxx.xxx.xxx.xxx/22"]
  target_tags = ["kvs"]
}
*/

