terraform {

  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.31.0"
    }
  }

}

provider "aws" {
  region = var.aws__resource_region

  default_tags {
    # tags = {
    #   "owner"     = "Diego"
    #   "objective" = "Terraform course"
    # }

    # exemplo abaixo utilizando o locals
    tags = local.tags
  }
}