# setting a variable for subnet b within my d4 VPC
variable "subnetpublicb" {
  description = "Public Subnet B"
  # this is what my subnet -id is. Yours will be different
  default = "subnet-0ce9745c4ed7e5abd"
}

# setting a variable for deployment4 security group
variable "vpcd4sg" {
  description = "Deployment 4 SG"
  # this is what my sg -id is. Yours will be different
  default  = "sg-0b8a9fc187d4744d2"
}


# configure aws provider
provider "aws" {
  # for access/secret key please enter your own
  access_key = ""
  secret_key = ""
  region = "us-east-1"
  #profile = "Admin"
}

# create instance
resource "aws_instance" "web_server01" {
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  # refering back to deployment 4 GS
  vpc_security_group_ids = ["${var.vpcd4sg}"]
  # refering back to subnet b within d4 vps
  subnet_id ="${var.subnetpublicb}"
  associate_public_ip_address = true
  #key_name = "ubuntuSandbox"

  user_data = "${file("/home/ubuntu/terraform/deploy.sh")}"

  tags = {
    "Name" : "tf_made_instance"
  }

}


output "instance_ip" {
  value = aws_instance.web_server01.public_ip
}




