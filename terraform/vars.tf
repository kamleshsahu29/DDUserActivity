variable "AWS_REGION" {
default = "ap-southeast-1"
}

variable "AMI" {

	type = map
		default = {
			ap-southeast-1 = "ami-0f74c08b8b5effa56"
			ap-south-1 = "ami-0f2e255ec956ade7f"
		}

}


variable "KF_APP_NAME" {
	default = "User-Activities"
  
}

variable "KF_DEST" {
	default = "s3"
}
