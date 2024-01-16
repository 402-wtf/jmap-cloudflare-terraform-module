resource "cloudflare_worker_script" "email_ingress" {
  account_id = data.cloudflare_zone.primary_domain.account_id
  name       = join("-", [var.base_name, "email-jmap-handler"])
  module     = true
  content    = templatefile("${path.module}/workers/email-jmap-handler.js.tftpl", {
    allowed_email = var.allowed_email
  })
}

data "cloudflare_zone" "primary_domain" {
  name = var.primary_domain
}

resource "cloudflare_worker_domain" "email_ingress" {
  account_id = data.cloudflare_zone.primary_domain.account_id
  hostname   = join(".", ["email-ingress", var.primary_domain])
  service    = cloudflare_worker_script.email_ingress.name
  zone_id    = data.cloudflare_zone.primary_domain.zone_id
}
