resource "aws_instance" "myec2instances" {
  for_each = var.instances
  ami = "ami-09c813fb71547fc4f"
  instance_type = each.value
  vpc_security_group_ids = [ aws_security_group.allow-ssh.id ]
  tags = {
    Name = each.key
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