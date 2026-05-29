terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.46.0"
    }
  }

  backend "s3" {
  bucket = "remote-state-practice-88c"
  key = "remote-state-terraform.tfstate"
  region = "us-east-1"
  encrypt = true
  use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}