terraform {
  required_version = ">=0.14.6"
  required_providers {
    aws = {
      version = "~>3.27.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

