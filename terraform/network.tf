resource "aws_internet_gateway" "dd-igw" {
	vpc_id = "${aws_vpc.dd-vpc.id}"
	tags ={
		Name = "dd-igw"
		}
}

resource "aws_route_table" "dd-crt" {
	vpc_id = "${aws_vpc.dd-vpc.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.dd-igw.id}"
	}
	tags ={
		Name = "dd-crt"
	}
}

resource "aws_route_table_association" "dd-crt-subnet" {

	subnet_id = "${aws_subnet.dd-subnet-1.id}"
	route_table_id = "${aws_route_table.dd-crt.id}"
}

resource "aws_security_group" "dd-securitygroup" {
	
	vpc_id = "${aws_vpc.dd-vpc.id}"
	
	egress {
		from_port = 0
		to_port = 65535
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]

	}

	ingress {

		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}


	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	
	}

}

