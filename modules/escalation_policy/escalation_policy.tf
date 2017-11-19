variable "pagerduty_escalation_policy_variables" {
  type = "map"
  description = "escalation policy変数"
  default = {
    name                        = ""
    escalation_delay_in_minutes = ""
    target_user_id              = ""
  }
}

variable "teams" {
  type = "list"
  default = []
}

/**
 * エスカレーションポリシー作成
 * https://www.terraform.io/docs/providers/pagerduty/r/escalation_policy.html
 */
resource "pagerduty_escalation_policy" "escalation_policy" {
  name  = "${var.pagerduty_escalation_policy_variables["name"]}"
  teams = "${var.teams}"

  rule {
    escalation_delay_in_minutes = "${var.pagerduty_escalation_policy_variables["escalation_delay_in_minutes"]}"

    target {
      type = "user"
      id   = "${var.pagerduty_escalation_policy_variables["target_user_id"]}"
    }
  }
}

output "escalation_policy_id" {
  value = "${pagerduty_escalation_policy.escalation_policy.id}"
}
