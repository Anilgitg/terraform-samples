resource "aws_instance" "myec2instances" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow-ssh.id ]
  tags = {
    Name = "terraform"
  }
   provisioner "local-exec" {
     command = "echo ${self.private_ip} > pubilc_ip.text"
   }

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip
    }

    provisioner "remote-exec" {
      inline = [  
        "sudo dnf install ansible -y",
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx",
      ]
    }

    provisioner "remote-exec" {
      when = destroy
      inline = [  
        "sudo systemctl stop nginx",
      ]
    }
}

resource "aws_security_group" "allow-ssh" {
  name = "Allow-myssh"
  description = "to allow ssh"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow-mySsh"
  }
}