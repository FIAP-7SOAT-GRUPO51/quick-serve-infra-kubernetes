terraform {
  backend "s3" {
    bucket = "backend-tf1234"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}