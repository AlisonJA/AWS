
# New resource for the S3 bucket our application will use.
#resource "aws_s3_bucket" "example" {

#  bucket = "terraform-test-bucket-alison"
#  acl    = "private"
#}

### resources definition
	resource "aws_instance" "webserver" {
		ami = "ami-061a2d878e5754b62"
		instance_type = "t2.micro"
		key_name = "${var.key_name}"
		#depends_on = ["aws_s3_bucket.example"]

		provisioner "local-exec" {
    command = "echo ${aws_instance.webserver.public_ip} > ip_address.txt"
		}
	#the provisioner means that I can upload files, run shell scripts and trigger other software
	#local-exec will run the command on the machine running terraform, ie this one
}

#resource "aws_instance" "second_server" {
  #ami           = "ami-061a2d878e5754b62"
  #instance_type = "t2.micro"
#}

resource "aws_eip" "ip" {
  instance = "${aws_instance.webserver.id}"
}


### output definition
output "aws_instance_public_dns" {
	value = "${aws_instance.webserver.public_dns}"
}
