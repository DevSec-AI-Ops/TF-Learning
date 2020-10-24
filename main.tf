provider "aws" {
    access_key = "xxxxxxxxxxxxxxxxxxxxxx"
    secret_key = "xxxxxxxxxxxxxxxxxxxxxxxx"
    region = "us-east-1"
}

resource "aws_s3_bucket" "state" {
  bucket = var.state_bucket
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
module "s3buckets" {
    source = "./modules"  
}