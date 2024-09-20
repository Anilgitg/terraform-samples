resource "aws_route53_record" "route53" {
  count = length(var.instance_names)
  name = var.instance_names[count.index] == "frontend" ? local.domain_name : "${var.instance_names[count.index]}. ${local.domain_name}"
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.myec2instance[count.index].public_ip] : [aws_instance_myec2instance[count.index].private_ip]
  zone_id = local.zone_id
  type = "A"
  ttl = 1
  allow_overwrite = true
}