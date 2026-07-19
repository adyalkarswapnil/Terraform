resource "aws_s3_bucket" "remote_s3" {
  bucket = "TWS-Junoon-state-bucket"

  tags = {
    Name        = "TWS-Junoon-state-bucket"
    Environment = "Dev"
  }
}