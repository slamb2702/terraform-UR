# resource "aws_db_instance" "example" {
#   identifier_prefix   = "terraform-up-and-running"
#   engine              = "mysql"
#   allocated_storage   = 10
#   instance_class      = "db.t3.micro"
#   skip_final_snapshot = true
#   db_name             = var.db_name

#   # How should we set username and password? 
#   username = var.db_username
#   password = var.db_password
# }


module "mysql_primary" {
  source = "../../../modules/data-stores/mysql"

  providers = {
    aws = aws.primary
  }

  db_name     = "stage_db"
  db_username = var.db_username
  db_password = var.db_password

  # Must be enabled to support replication
  backup_retention_period = 1
}


# Uncomment for replica of primary db

# module "mysql_replica" {
#   source = "../../../modules/data-stores/mysql"

#   providers = {
#     aws = aws.replica
#   }

#   # Make this a replica
#   replicate_source_db = module.mysql_primary.arn
# }