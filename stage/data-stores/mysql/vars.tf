variable "db_username" {
  description = "The username of the database"
  type        = string
  sensitive   = true
  default     = "null"
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
  default     = "null"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "example_database_stage"
}
