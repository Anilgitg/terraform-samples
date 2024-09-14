variable "ami-id" {
  type = string 
  default = "ami-09c813fb71547fc4f"
  description = "this is the AMI id for RHEL 9"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "this is AWS instance type"
}

variable "tags" {
  type = map
  default = {
    Name ="backend"
    Project = "expense"
    Component = "backend"
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "sg_name" {
  type = string
  default = "allow-myssh1"
}

variable "sg_description" {
  type = string
  default = "allow port 22 for ssh to allow all"
}

variable "ingres_cidr" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}