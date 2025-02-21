terraform {
    backend "s3" {
        bucket          = "terraform-tfstate-timeoff-app"
        encrypt         = true
        key             = "terraform"
        region          = "us-east-1"
    }

    required_providers {
        aws = {
            source      = "hashicorp/aws"
            version     = "~> 3.0"
        }
    }
}