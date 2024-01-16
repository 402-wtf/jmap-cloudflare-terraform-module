resource "cloudflare_r2_bucket" "email_bucket" {
  account_id = data.cloudflare_zone.primary_domain.account_id
  name       = join("-", [var.base_name, "email-bucket"])
}
