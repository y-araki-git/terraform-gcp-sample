provider "google" {
  credentials = "${file("../../cred/samplejson")}"
  project     = "sampleproject"
  region      = "asia-northeast1"
}
