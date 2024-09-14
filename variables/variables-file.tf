# variables preference in terraform:
# 1. command line -var="instance_type=t2.small"
# 2. terraform.tfvars
# 3. default variables
# 4. export TF_VAR_instance_type=t3.small(to unset this variable ==>>> unset TF_VAR_Instance_type)
# 5. prompt variables

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