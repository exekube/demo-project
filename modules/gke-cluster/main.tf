terraform {
  backend "gcs" {}
}

variable "project_id" {}
variable "serviceaccount_key" {}

module "gke_cluster" {
  source             = "/exekube-modules/gke-cluster"
  project_id         = "${var.project_id}"
  serviceaccount_key = "${var.serviceaccount_key}"

  main_compute_zone  = "europe-west1-d"
  node_type          = "n1-standard-1"
  initial_node_count = 2

  oauth_scopes = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/devstorage.read_write",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
  ]
}
