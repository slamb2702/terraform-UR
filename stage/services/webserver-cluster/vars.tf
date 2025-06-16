variable "environment" {
  description = "The name of the environment"
  type        = string
}

variable "remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
}

variable "remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
}