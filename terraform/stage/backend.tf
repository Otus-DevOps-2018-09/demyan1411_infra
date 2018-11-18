terraform {
  backend "gcs" {
    bucket = "storage-bucket-demyan-stage"
    prefix = "terraform/state"
  }
}
