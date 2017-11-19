// トークン
pagerduty_token = "bayguh"

# team
pagerduty_team_setting {
  name        = "bayguh"
  description = "bayguhチーム"
}

# crit
pagerduty_user_crit_setting {
  name  = "bayguh-crit-user"
  email = "bayguh-crit@gmail.com"
  role  = "team_responder"
}
pagerduty_escalation_policy_crit_setting {
  name                        = "bayguh-crit-policy"
  escalation_delay_in_minutes = 30
}
pagerduty_service_crit_setting {
  name                    = "bayguh-crit-service"
  auto_resolve_timeout    = "14400"
  acknowledgement_timeout = "1800"
}

# warn
pagerduty_user_warn_setting {
  name  = "bayguh-warn-user"
  email = "bayguh-warn@gmail.com"
  role  = "team_responder"
}
pagerduty_escalation_policy_warn_setting {
  name                        = "bayguh-warn-policy"
  escalation_delay_in_minutes = 30
}
pagerduty_service_warn_setting {
  name                    = "bayguh-warn-service"
  auto_resolve_timeout    = "14400"
  acknowledgement_timeout = "1800"
}

# notice
pagerduty_user_notice_setting {
  name  = "bayguh-notice-user"
  email = "bayguh-notice@gmail.com"
  role  = "team_responder"
}
pagerduty_escalation_policy_notice_setting {
  name                        = "bayguh-notice-policy"
  escalation_delay_in_minutes = 30
}
pagerduty_service_notice_setting {
  name                    = "bayguh-notice-service"
  auto_resolve_timeout    = "14400"
  acknowledgement_timeout = "1800"
}
