resource "aws_s3_bucket" "kfS3Bucket" {
  bucket_prefix = "dareData-test-"

  tags = {
    Name = "User Activity"
    Environment = "production"
  }
}

resource "aws_s3_bucket_acl" "kfS3BucketACL" {
  
  bucket = aws_s3_bucket.kfS3Bucket.id
  acl = "private"
}