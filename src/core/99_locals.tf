locals {
  project        = "${var.prefix}-${var.env_short}-${var.location_short}-${var.domain}"
  adgroup_prefix = "${var.adgroup_prefix}-${var.env_short}"
  # product = "${var.prefix}-${var.env_short}"
}
