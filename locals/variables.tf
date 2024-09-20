variable "instance_names" {
  type = list(string)
  default = [ "mysql", "frontend", "backend" ]
}

# variable "domain_name" {
#     type = string
#     default = "value"
# }

# variable "zone_id" {
#   type = string
#   default = "value"
# }

variable "environment" {
  type = string
  default = "prod"
}