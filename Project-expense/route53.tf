resource "aws_route53_record" "expense"{
 count = length(var.instance_names)
 zone_id = var.zone_id
 #backend.doaminname
 name = "${var.instance_names[count.index]}.${var.doamin_name}"
 type = "A"
 ttl = 1
 records = [ output.instances_info[count.index].private_ip ]
 allow_overwrite = true 
}