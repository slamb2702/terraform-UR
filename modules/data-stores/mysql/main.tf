resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  allocated_storage   = 10
  instance_class      = "db.t3.micro"
  skip_final_snapshot = true


  #Enable backups
  backup_retention_period = var.backup_retention_period
  #If specified, this db will be a replica"
  replicate_source_db = var.replicate_source_db

  #Only set these parameters if replicate_source_db is not set
  engine   = var.replicate_source_db == null ? "mysql" : null
  db_name  = var.replicate_source_db == null ? var.db_name : null
  username = var.replicate_source_db == null ? var.db_username : null
  password = var.replicate_source_db == null ? var.db_password : null
}