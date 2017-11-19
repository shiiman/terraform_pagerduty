variable "pagerduty_token" {}

/**
 * プロバイダー設定
 * https://www.terraform.io/docs/providers/pagerduty/index.html
 */
provider "pagerduty" {
  token = "${var.pagerduty_token}"
}
