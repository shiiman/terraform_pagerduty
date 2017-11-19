variable "pagerduty_service_variables" {
  type = "map"
  description = "サービス変数"
  default = {
    name                    = ""
    escalation_policy       = ""
    auto_resolve_timeout    = ""
    acknowledgement_timeout = ""
  }
}

/**
 * サービス作成
 * https://www.terraform.io/docs/providers/pagerduty/r/service.html
 */
resource "pagerduty_service" "service" {
  name                    = "${var.pagerduty_service_variables["name"]}"
  escalation_policy       = "${var.pagerduty_service_variables["escalation_policy"]}"
  auto_resolve_timeout    = "${var.pagerduty_service_variables["auto_resolve_timeout"]}"
  acknowledgement_timeout = "${var.pagerduty_service_variables["acknowledgement_timeout"]}"

  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
}

output "service_id" {
  value = "${pagerduty_service.service.id}"
}
