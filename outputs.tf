output "cidr_house_rules_sg_security_group_id_tcp" {
  value = "${aws_security_group.chr_sg_security_group_tcp.id}"
}

output "cidr_house_rules_sg_security_group_id_udp" {
  value = "${aws_security_group.chr_sg_security_group_udp.id}"
}

output "cidr_house_rules_sg_security_group_id_icmp" {
  value = "${aws_security_group.chr_sg_security_group_icmp.id}"
}
