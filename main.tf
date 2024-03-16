#VIKINGS.of.AZUBI

#Create a Terraform Project To Create a t2.micro​ EC2 instance :
provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "web_server"{
    ami = "ami-0914547665e6a707c"
    instance_type = "t3.micro"
    security_groups = [aws_security_group.azubi-sg.name]

    user_data = <<-EOF

    #!/bin/bash
    sudo su 
    yun update -y
    yun install httpd -y
    systemcl start httpd
    system enable httpd
    EOF

    tags = {
        name = "azubiEC2instance"
    }
}

#Modify your Terraform script to include a security group​ that allows inbound HTTP​ traffic and take screenshots of the modification process and security group rules

resource "aws_security_group" "azubi-sg" {
  name = "web-sg"
  description = "HTTP inbound traffic"
  vpc_id = "vpc-0f5aa24ae624a180e" 

  ingress {
    from_port = 80
    to_port  = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = [ "::/0" ]
  }
}

#Create an output file that captures the following and capture the resulting output
#  instance_id​.
output "instance_id" {
  value = aws_instance.web_server.id
}
#  private_ip​.
output "private_ip" {
  value = aws_instance.web_server.private_ip
}
#  instance_name
output "instance_name" {
  value = aws_instance.web_server.tags
}
