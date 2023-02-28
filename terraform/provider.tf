terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
  }
  backend "s3" {
    bucket = "projectupgrad"
    key    = "state/myinfra.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

