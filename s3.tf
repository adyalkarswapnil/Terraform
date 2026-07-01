resource "aws_s3_bucket" "my_bucket_Swapnil" {
  bucket = "Swapnil-my-tf-test-bucket-2026"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}