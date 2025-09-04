terraform {
  required_version = "1.6.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  alias  = "primary"
}

provider "aws" {
  region = "eu-west-2"
  alias  = "replica"
}
