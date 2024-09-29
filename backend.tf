terraform {
  backend "s3" {
    bucket = "backend-tf123"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}