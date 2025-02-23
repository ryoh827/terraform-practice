resource "aws_s3_bucket" "practice_bucket" {
  bucket = "practice-bucket-123456"
}

resource "aws_s3_bucket_ownership_controls" "practice_bucket_ownership_controls" {
  bucket = aws_s3_bucket.practice_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "practice_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.practice_bucket_ownership_controls]

  bucket = aws_s3_bucket.practice_bucket.id
  acl    = "private"
}

