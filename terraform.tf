terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.53.0"
    }
  }
}

backend "s3" {
  bucket = "deviji-junoon-state-buckets"
  key    = "terraform.tfstate"
  region = "us-east-2"
  dynamodb_table = "TWS-Junoon_state-table"
}