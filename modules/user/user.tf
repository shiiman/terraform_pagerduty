variable "pagerduty_user_variables" {
  type = "map"
  description = "pagerduty_user変数"
  default = {
    name  = ""
    email = ""
    role  = ""
  }
}

variable "teams" {
  type = "list"
  default = []
}

/**
 * ユーザ作成
 * https://www.terraform.io/docs/providers/pagerduty/r/user.html
 */
resource "pagerduty_user" "user" {
  name  = "${var.pagerduty_user_variables["name"]}"
  email = "${var.pagerduty_user_variables["email"]}"
  role  = "${var.pagerduty_user_variables["role"]}"
  teams = ["${var.teams}"]
}

output "user_id" {
  value = "${pagerduty_user.user.id}"
}
