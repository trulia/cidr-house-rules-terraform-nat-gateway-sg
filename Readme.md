cidr-house-rules-terraform-nat-gateway Terraform module
===========

This module allows for whitelisting of an entire team's NAT gateway IPs using cidr-house-rules API


Module Input Variables
----------------------

- `team_to_whitelist` A team that is tracked by cidr-house-rules system
- `from_port`
- `to_port`
- `vpc_id` VPC to apply security group to
- `cidr_house_rules_endpoint` The API endpoint for cidr-house-rules, required! example: https://mycidr-house-rules-deploy.mydomain.com/prod/
- `cidr_house_api_key` AWS API Gateway API key for cidr house rules access
- `product` The product this security group is supporting
- `environment` The environment this security group is supporting, i.e. dev, stage, or prod

Usage
-----

```
module "platform-team-access" {
  source            = "https://github.com/trulia/cidr-house-rules-terraform-nat-gateway-sg.git"
  team_to_whitelist = "platform-team"
  from_port         = "443"
  to_port           = "443"
  vpc_id            = "vpc-1233455"
  product           = "platform"
  environment       = "prod" 
}
```

Outputs
=======

 - `cidr_house_rules_sg_security_group_id_tcp` - ID of security group created
 - `cidr_house_rules_sg_security_group_id_udp` - ID of security group created
 - `cidr_house_rules_sg_security_group_id_icmp` - ID of security group created
