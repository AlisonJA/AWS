## resource definition



resource "aws_instance" "example" {
  ami           = "ami-0b0a60c0a2bd40612"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

## output definition
output "aws_instance_public_dns" {
  value = "${aws_instance.example.public_dns}"
}
