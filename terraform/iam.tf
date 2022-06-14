resource "aws_iam_role" "firehose-stream-role" {
  name = "ap-stream-role"

  assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Action": "sts:AssumeRole",
"Principal": {"Service": "firehose.amazonaws.com"},
"Effect": "Allow","Sid": ""
}
]
}

EOF
}

resource "aws_iam_role_policy" "s3policy" {
  name = "s3policy"
  role = aws_iam_role.firehose-stream-role.id
  policy = jsonencode({
     "Version": "2012-10-17",  
    "Statement":[{      
            "Effect": "Allow",      
            "Action": [
                "s3:AbortMultipartUpload",
                "s3:GetBucketLocation",
                "s3:GetObject",
                "s3:ListBucket",
                "s3:ListBucketMultipartUploads",
                "s3:PutObject"
            ],      
            "Resource": [        
              "*"
            ]    
        }]
  })
}
