variable "pagerduty_service_integration_variables" {
  type = "map"
  description = "サービス変数"
  default = {
    service = ""
  }
}

/**
 * https://www.terraform.io/docs/providers/pagerduty/d/vendor.html
 */
data "pagerduty_vendor" "mackerel" {
  name = "mackerel"
}

/**
 * サービスインテグレーション作成
 * https://www.terraform.io/docs/providers/pagerduty/r/service_integration.html
 */
resource "pagerduty_service_integration" "service_integration" {
  name    = "${data.pagerduty_vendor.mackerel.name}"
  service = "${var.pagerduty_service_integration_variables["service"]}"
  vendor  = "${data.pagerduty_vendor.mackerel.id}"
}

output "service_integration_id" {
  value = "${pagerduty_service_integration.service_integration.id}"
}
