variable "instance_names" {
  type = list(string)
  default = ["mysql", "backend", "frontend"]
  description = "ec2 instances for the project"
}

variable "zone_id" {
  type    = string
  default = "value"
}

variable "domain_name" {
  default = ""
}