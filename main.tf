variable pagerduty_team_setting { type = "map" }

variable pagerduty_user_crit_setting { type = "map" }
variable pagerduty_escalation_policy_crit_setting { type = "map" }
variable pagerduty_service_crit_setting { type = "map" }

variable pagerduty_user_warn_setting { type = "map" }
variable pagerduty_escalation_policy_warn_setting { type = "map" }
variable pagerduty_service_warn_setting { type = "map" }

variable pagerduty_user_notice_setting { type = "map" }
variable pagerduty_escalation_policy_notice_setting { type = "map" }
variable pagerduty_service_notice_setting { type = "map" }

/**
 * terraform対応バージョン
 * https://www.terraform.io/docs/configuration/terraform.html
 */
terraform {
  required_version = "= 0.11.0"
}

# team
module "pagerduty_team" {
  source = "modules/team"

  pagerduty_team_variables {
    name        = "${var.pagerduty_team_setting["name"]}"
    description = "${var.pagerduty_team_setting["description"]}"
  }
}

# crit ==================================================

# user crit
module "pagerduty_user_crit" {
  source = "modules/user"

  pagerduty_user_variables {
    name  = "${var.pagerduty_user_crit_setting["name"]}"
    email = "${var.pagerduty_user_crit_setting["email"]}"
    role  = "${var.pagerduty_user_crit_setting["role"]}"
  }

  teams = ["${module.pagerduty_team.team_id}"]
}

# escalation policy crit
module "pagerduty_escalation_policy_crit" {
  source = "modules/escalation_policy"

  pagerduty_escalation_policy_variables {
    name                        = "${var.pagerduty_escalation_policy_crit_setting["name"]}"
    escalation_delay_in_minutes = "${var.pagerduty_escalation_policy_crit_setting["escalation_delay_in_minutes"]}"
    target_user_id              = "${module.pagerduty_user_crit.user_id}"
  }

  teams = ["${module.pagerduty_team.team_id}"]
}

# service crit
module "pagerduty_service_crit" {
  source = "modules/service"

  pagerduty_service_variables {
    name                    = "${var.pagerduty_service_crit_setting["name"]}"
    escalation_policy       = "${module.pagerduty_escalation_policy_crit.escalation_policy_id}"
    auto_resolve_timeout    = "${var.pagerduty_service_crit_setting["auto_resolve_timeout"]}"
    acknowledgement_timeout = "${var.pagerduty_service_crit_setting["acknowledgement_timeout"]}"
  }
}

# =======================================================

# warn ==================================================

# user warn
module "pagerduty_user_warn" {
  source = "modules/user"

  pagerduty_user_variables {
    name  = "${var.pagerduty_user_warn_setting["name"]}"
    email = "${var.pagerduty_user_warn_setting["email"]}"
    role  = "${var.pagerduty_user_warn_setting["role"]}"
  }

  teams = ["${module.pagerduty_team.team_id}"]
}

# escalation policy warn
module "pagerduty_escalation_policy_warn" {
  source = "modules/escalation_policy"

  pagerduty_escalation_policy_variables {
    name                        = "${var.pagerduty_escalation_policy_warn_setting["name"]}"
    escalation_delay_in_minutes = "${var.pagerduty_escalation_policy_warn_setting["escalation_delay_in_minutes"]}"
    target_user_id              = "${module.pagerduty_user_warn.user_id}"
  }

  teams = ["${module.pagerduty_team.team_id}"]
}

# service warn
module "pagerduty_service_warn" {
  source = "modules/service"

  pagerduty_service_variables {
    name                    = "${var.pagerduty_service_warn_setting["name"]}"
    escalation_policy       = "${module.pagerduty_escalation_policy_warn.escalation_policy_id}"
    auto_resolve_timeout    = "${var.pagerduty_service_warn_setting["auto_resolve_timeout"]}"
    acknowledgement_timeout = "${var.pagerduty_service_warn_setting["acknowledgement_timeout"]}"
  }
}

# =======================================================

# notice ================================================

# user notice
module "pagerduty_user_notice" {
  source = "modules/user"

  pagerduty_user_variables {
    name  = "${var.pagerduty_user_notice_setting["name"]}"
    email = "${var.pagerduty_user_notice_setting["email"]}"
    role  = "${var.pagerduty_user_notice_setting["role"]}"
  }

  teams = ["${module.pagerduty_team.team_id}"]
}

# escalation policy notice
module "pagerduty_escalation_policy_notice" {
  source = "modules/escalation_policy"

  pagerduty_escalation_policy_variables {
    name                        = "${var.pagerduty_escalation_policy_notice_setting["name"]}"
    escalation_delay_in_minutes = "${var.pagerduty_escalation_policy_notice_setting["escalation_delay_in_minutes"]}"
    target_user_id              = "${module.pagerduty_user_notice.user_id}"
  }

  teams = ["${module.pagerduty_team.team_id}"]
}

# service notice
module "pagerduty_service_notice" {
  source = "modules/service"

  pagerduty_service_variables {
    name                    = "${var.pagerduty_service_notice_setting["name"]}"
    escalation_policy       = "${module.pagerduty_escalation_policy_notice.escalation_policy_id}"
    auto_resolve_timeout    = "${var.pagerduty_service_notice_setting["auto_resolve_timeout"]}"
    acknowledgement_timeout = "${var.pagerduty_service_notice_setting["acknowledgement_timeout"]}"
  }
}

# =======================================================
