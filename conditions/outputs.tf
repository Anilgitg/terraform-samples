output "public_ip" {
  description = "this is the public IP of Ec2 instance"
  value       = aws_instance.example.public_ip
}

output "private_ip" {
  description = "this is the private IP of Ec2 instance"
  value       = aws_instance.example.private_ip
}