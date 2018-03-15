resource "aws_security_group" "chr_sg_security_group_tcp" {
  name        = "ng-sg-${var.team_to_whitelist}-${var.product}-${var.environment}-tcp"
  description = "Nat gateway whitelist for ${var.team_to_whitelist} tcp"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = "${var.from_port}"
    to_port     = "${var.to_port}"
    protocol    = "tcp"
    cidr_blocks = ["${split(",", data.http.vpc-nat-gateway-api.body)}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "chr_sg_security_group_udp" {
  name        = "ng-sg-${var.team_to_whitelist}-${var.product}-${var.environment}-udp"
  description = "Nat gateway whitelist for ${var.team_to_whitelist} udp "
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = "${var.from_port}"
    to_port     = "${var.to_port}"
    protocol    = "udp"
    cidr_blocks = ["${split(",", data.http.vpc-nat-gateway-api.body)}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "chr_sg_security_group_icmp" {
  name        = "ng-sg-${var.team_to_whitelist}-${var.product}-${var.environment}-icmp"
  description = "Nat gateway whitelist for ${var.team_to_whitelist} icmp"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${split(",", data.http.vpc-nat-gateway-api.body)}"]
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
