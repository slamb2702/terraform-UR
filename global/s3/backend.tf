terraform {
  backend "s3" {
    bucket = "terraform-state-use2-slamb2702"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

