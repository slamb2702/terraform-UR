module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webservers-${var.environment}"

  db_remote_state_bucket = var.remote_state_bucket
  db_remote_state_key    = "${var.environment}/${var.remote_state_key}"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 10

  enable_autoscaling = var.enable_autoscaling

  custom_tags = {
    Owner     = "big-dog"
    ManagedBy = "terraform"
  }
}
