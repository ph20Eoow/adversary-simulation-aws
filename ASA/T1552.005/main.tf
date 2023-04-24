terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "T1552-005-EC2" {
  source = "./module/ec2"  
  root_vol_size = 30
  root_vol_type = "gp2"
  data_vol_size = 10
  data_vol_type = "gp2"
  instance_name = "T1552-005-win"
  instance_type = "t2.micro"
}