variable "base_name" {
  description = "The name used to prefix most resources"
  default = ""
  type = string
}

variable "account_id" {
  description = "The Cloudflare Account ID to apply resources to"
  type = string
}

variable "primary_domain" {
  description = "The primary domain used for worker deployment. This should be an FQDN that already is added as a DNS zone."
  type = string
}

variable "allowed_email" {
  description = "List of email addresses that the email ingress should handle"
  type = list(string)
}
