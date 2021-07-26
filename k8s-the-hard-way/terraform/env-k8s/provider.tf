provider "aws" {
  region  = "eu-west-1"
  assume_role {
    role_arn = "arn:aws:iam::604715813866:role/tf-applier"
  }
}

terraform {
  required_providers {
    aws = {
      version = "~> 2.31"
    }
  }
  required_version = "0.14.10"
  backend "s3" {
    bucket = "k8s-hw-tfstate"
    key    = "ec2.tfstate"
    region = "eu-west-1"

    role_arn = "arn:aws:iam::604715813866:role/tf-applier"
  }
}
