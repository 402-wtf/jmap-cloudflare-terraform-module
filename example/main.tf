module "jmap-cloudflare" {
  source = "../"

  base_name  = "example"
  primary_domain = "example.com"
  allowed_email = ["friends@example.com", "coworker@example.com"]
}
