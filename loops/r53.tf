resource "aws_route53_record" "www" {
  count = 3
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}" #mongodb.daws84s.site It's called interpolation where we are concatenate the strings
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip]
}