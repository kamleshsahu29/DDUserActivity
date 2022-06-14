resource "aws_key_pair" "ap-kp" {
    key_name = "ap-kp"
    public_key = "${file("./keys/ap-kp.pub")}"
}
resource "aws_instance" "webServer" {
    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type ="t2.micro"

    subnet_id = "${aws_subnet.dd-subnet-1.id}"
    vpc_security_group_ids = ["${aws_security_group.dd-securitygroup.id}"]
    key_name = "${aws_key_pair.ap-kp.id}"
   
   user_data = "./userData/webAppInit.sh"
}