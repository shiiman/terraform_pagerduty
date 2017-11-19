variable "pagerduty_team_variables" {
  type = "map"
  description = "チーム変数"
  default = {
    name        = ""
    description = ""
  }
}

/**
 * チーム作成
 * https://www.terraform.io/docs/providers/pagerduty/r/team.html
 */
resource "pagerduty_team" "team" {
  name        = "${var.pagerduty_team_variables["name"]}"
  description = "${var.pagerduty_team_variables["description"]}"
}

output "team_id" {
  value = "${pagerduty_team.team.id}"
}
