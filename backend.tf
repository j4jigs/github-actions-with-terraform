#This is terraform tfstate file location in s3 bucket
terraform {
  backend "s3" {
    bucket = "github-actions-demo-987699"
    key    = "github-actions-demo.tfstate"
    region = "us-east-1"
  }
}
