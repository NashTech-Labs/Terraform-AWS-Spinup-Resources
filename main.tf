provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    region  = "ca-central-1"
    bucket  = "iac-terraform-demo"
    key     = "tfstate"
    encrypt = true
  }
}

module "environment" {
  source            = "./environment/demo"
  rds-password = "${var.rds-password}"
  db_password  = "${var.rds-password}"
}
