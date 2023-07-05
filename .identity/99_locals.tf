locals {
  project  = "${var.prefix}-${var.env_short}-${var.location_short}-core"
  app_name = "github-${var.github.org}-${var.github.repository}-${var.env}"
}
