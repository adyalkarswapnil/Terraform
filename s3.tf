resource "aws_s3_bucket" "my_bucket_swapnil" {
  bucket = "swapnil-my-tf-test-bucket-2026"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}