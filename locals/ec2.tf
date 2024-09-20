resource "aws_instance" "myec2instance" {
  count = length(var.instance_names)
  ami = data.aws_ami.amiid.id
  instance_type = var.instance_names == "mysql" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow-ssh.id]

  tags = {
    Name = var.instance_names[count.index]
  }
}

resource "aws_security_group" "allow-ssh" {
  name = "Allow-ssh"
  description = "to allow ssh"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow-mySsh"
  }
}

resource "aws_instance" "elasticsearch" {
  ami = data.aws_ami.amiid.id
  instance_type = local.instance_type
  vpc_security_group_ids = [ aws_security_group.allow-ssh.id ]
  tags = {
    Name = "elasticinstance"
  }
}