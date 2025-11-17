resource "aws_s3_bucket" "my_bucket" {
  bucket = "asdasdwqeqw23221asas" # must be globally unique & lowercase

  tags = {
    Name = "MyBucket"
  }
}

resource "aws_s3_bucket" "my_bucketw" {
  bucket = "asdasdwqeqw23221asasasdasdasd" # must be globally unique & lowercase

  tags = {
    Name = "MyBuckewt"
  }
}
