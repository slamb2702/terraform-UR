module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webservers-${var.environment}"

  db_remote_state_bucket = var.remote_state_bucket
  db_remote_state_key    = "${var.environment}/${var.remote_state_key}"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
}


# used for exposing extra ports
#
# resource "aws_security_group_rule" "allow_testing_inbound" {
#   type = "ingress"
#   security_group_id = module.webserver_cluster.alb_security_group_id

#   from_port = 12345
#   to_port = 12345
#   protocol = "tcp"
#   cidr_blocks = [ 
#     "0.0.0.0/0"
#    ]
# }