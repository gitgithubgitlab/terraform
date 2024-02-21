terraform {
  backend "s3" {
    bucket = "terra-state-z"
    key    = "terraform/backend-dove"
    region = "us-east-2"

  }
}

####s3://terra-state-z/terraform/



