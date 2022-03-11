provider "aws" {
  profile    = "personal"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "timeoff_bucket" {
  bucket = "terraform-tfstate-timeoff-app"
  acl    = "private"

  tags = {
    CreatedBy   = "msaavedra91"
    Environment = "dev-test"
  }
}