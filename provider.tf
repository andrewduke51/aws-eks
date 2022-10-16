terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
}

terraform {
  backend "s3" {
    bucket         = "<YOUR_BUCKET>>"
    key            = "<YOUR_TF_STATE>>"
    region         = "<YOUR_REGION>>"
    encrypt        = true
    kms_key_id     = "<YOUR_KMS_KEY>"
    dynamodb_table = "<YOUR_TABLE>>"
  }
}