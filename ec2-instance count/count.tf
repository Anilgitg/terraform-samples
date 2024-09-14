resource "aws_instance" "example" {
    count = length(var.instance_names)
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.allow-myssh.id ]
    tags = merge(
        var.common_tags, 
        {
            Name = var.instance_names[count.index]
        }
    )
}

resource "aws_security_group" "allow-myssh" {
  name = "allow-ssh"
  description = "allow all ports through SSH"
  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.common_tags, 
    {
        Name = "Allow-All-ssh"
    }
  )
}


