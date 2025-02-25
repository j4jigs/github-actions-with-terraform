terraform {
  backend "s3" {
    bucket = "github-actions-demo-98769"
    key    = "github-actions-demo.tfstate"
    region = "us-east-1"
  }
}
