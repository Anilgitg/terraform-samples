resource "aws_route53_record" "r53record" {
  for_each = aws_instance.myec2instances
  name = each.key == "frontend" ? var.domainname : "${each.key}.${var.domainname}"
  ttl = 1
  type = "A"
  zone_id = var.zoneid
  records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite = true
}