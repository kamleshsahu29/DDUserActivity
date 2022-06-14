resource "aws_vpc" "dd-vpc" {
	cidr_block = "10.0.0.0/28"
	enable_dns_support = "true"
	enable_dns_hostnames = "true"
	enable_classiclink = "false"
	instance_tenancy = "default"

	}

resource "aws_subnet" "dd-subnet-1" {
	vpc_id = "${aws_vpc.dd-vpc.id}"
	cidr_block = "10.0.0.0/28"
	map_public_ip_on_launch = "true"
	availability_zone =  "ap-southeast-1a"
	
	}


