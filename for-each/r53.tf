resource "aws_route53_record" "www" {
  for_each = aws_instance.roboshop
  zone_id = var.zone_id
  #name    = "${var.instances[count.index]}.${var.domain_name}" #mongodb.daws84s.site It's called interpolation where we are concatenate the strings
  name = "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
 # records = [aws_instance.roboshop[count.index].private_ip]
  records = [each.value.private_ip]
}