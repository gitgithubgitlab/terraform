terraform {
  backend "s3" {
    bucket = "terra-state-z"
    key    = "terraform/vprofile"
    region = "us-east-2"
  }
}

