resource "aws_instance" "myec2instance" {
  ami = ""
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ssh.id  ]

  tags = {
    Name = "ec2-demo-server"
  }
}

resource "aws_security_group" "allow-ssh" {
    name = "allow-mySsh"
    description = "to allow ssh port"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "Allow-myssh"
    }
}