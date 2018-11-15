terraform {
  backend "gcs" {
    bucket  = "storage-bucket-demyan-prod"
    prefix  = "terraform/state"
  }
}
