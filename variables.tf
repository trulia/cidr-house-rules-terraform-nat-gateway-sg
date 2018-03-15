data "http" "vpc-nat-gateway-api" {
  url = "${var.cidr_house_rules_endpoint}/get_nat_gateways_for_team?team=${var.team_to_whitelist}"

  request_headers {
    "X-Api-Key" = "${var.cidr_house_api_key}"
  }
}

variable "from_port" {
  type        = "string"
  description = "The networking port to start accept range from"
  default     = "0"
}

variable "to_port" {
  type        = "string"
  description = "The networking port to end accept range"
  default     = "65535"
}

variable "vpc_id" {
  type        = "string"
  description = "The VPC ID to place this security group"
  default     = ""
}

variable "product" {
  type        = "string"
  description = "The product this security group is supporting"
  default     = "unknown"
}

variable "environment" {
  type        = "string"
  description = "The environment this security group is supporting, i.e. dev, stage, or prod"
  default     = "unknown"
}

variable "team_to_whitelist" {
  type        = "string"
  description = "The team to whitelist, should coorelate to a team/AWS account managed by cidr-house-rules"
}

variable "cidr_house_api_key" {
  type        = "string"
  description = "AWS API Gateway API key for cidr house rules access"
}

variable "cidr_house_rules_endpoint" {
    type        = "string"
    description = "The API endpoint for cidr-house-rules, required! example: https://mycidr-house-rules-deploy.mydomain.com/prod/"
}
