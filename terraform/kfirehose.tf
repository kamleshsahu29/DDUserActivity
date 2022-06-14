resource "aws_kinesis_firehose_delivery_stream" "dd-kf-profile" {
  name = "dd-kf-profile"
  destination = "${var.KF_DEST}"

 s3_configuration {
   role_arn = "${aws_iam_role.firehose-stream-role.arn}"
   bucket_arn= "${aws_s3_bucket.kfS3Bucket.arn}"
   buffer_size = 10
   buffer_interval = 400
   compression_format = "ZIP"
 } 
}

resource "aws_kinesis_firehose_delivery_stream" "dd-kf-track" {
  name = "dd-kf-track"
  destination = "${var.KF_DEST}"

 s3_configuration {
   role_arn = "${aws_iam_role.firehose-stream-role.arn}"
   bucket_arn= "${aws_s3_bucket.kfS3Bucket.arn}"
   buffer_size = 10
   buffer_interval = 400
   compression_format = "ZIP"
 } 
}


resource "aws_kinesis_firehose_delivery_stream" "dd-kf-alias" {
  name = "dd-kf-alias"
  destination = "${var.KF_DEST}"

 s3_configuration {
   role_arn = "${aws_iam_role.firehose-stream-role.arn}"
   bucket_arn= "${aws_s3_bucket.kfS3Bucket.arn}"
   buffer_size = 10
   buffer_interval = 400
   compression_format = "ZIP"
 } 
}