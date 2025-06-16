terraform {
  backend "s3" {
    bucket = "terraform-state-use2-slamb2702"
    key    = "prod/webcluster-server/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

