resource "aws_instance" "example" {
  ami                    = var.ami-id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow-myssh.id]
  tags                   = var.tags
}

resource "aws_security_group" "allow-myssh" {
  name        = var.sg_name
  description = var.sg_description
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.ingres_cidr
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = var.tags
}
