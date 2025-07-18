terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }
}

#One for Prod env
provider "aws" {
  # Configuration options
  alias = "prod"
  profile = "prod"
}

#one for Dev env 
provider "aws" {
  # Configuration options
  alias = "dev"
  profile = "dev"
}