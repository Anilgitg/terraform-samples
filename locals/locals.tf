locals {
  domain_name = ""
  zone_id = ""
  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
  #count.index will not work in locals
}