resource "aws_s3_bucket" "kfs3bucket" {
  bucket_prefix = "daredatatest"

  tags = {
    Name = "User Activity"
    Environment = "production"
  }
}

resource "aws_s3_bucket_acl" "kfd3bucket-acl" {
  
  bucket = aws_s3_bucket.kfs3bucket.id
  acl = "private"
}
