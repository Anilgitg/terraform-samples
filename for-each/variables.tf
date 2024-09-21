variable "instances" {
  type = map
  default = {
    mysql = "t3.small"
    backend = "t3.micro"
    frontend = "t3.micro"
 }
}

variable "zoneid" {
  type = string
  default = "value"
}

variable "domainname" {
  type = string
  default = "value"
}