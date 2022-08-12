terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region                  = "ca-central-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terraform"
}