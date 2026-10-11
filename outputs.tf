output "data_loss_prevention_discovery_configs_id" {
  description = "Map of id values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no id are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "data_loss_prevention_discovery_configs_actions" {
  description = "Map of actions values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no actions are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.actions if v.actions != null && length(v.actions) > 0 }
}
output "data_loss_prevention_discovery_configs_create_time" {
  description = "Map of create_time values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no create_time are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "data_loss_prevention_discovery_configs_deletion_policy" {
  description = "Map of deletion_policy values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no deletion_policy are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "data_loss_prevention_discovery_configs_display_name" {
  description = "Map of display_name values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no display_name are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "data_loss_prevention_discovery_configs_errors" {
  description = "Map of errors values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no errors are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.errors if v.errors != null && length(v.errors) > 0 }
}
output "data_loss_prevention_discovery_configs_inspect_templates" {
  description = "Map of inspect_templates values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no inspect_templates are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.inspect_templates if v.inspect_templates != null && length(v.inspect_templates) > 0 }
}
output "data_loss_prevention_discovery_configs_last_run_time" {
  description = "Map of last_run_time values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no last_run_time are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.last_run_time if v.last_run_time != null && length(v.last_run_time) > 0 }
}
output "data_loss_prevention_discovery_configs_location" {
  description = "Map of location values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no location are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.location if v.location != null && length(v.location) > 0 }
}
output "data_loss_prevention_discovery_configs_name" {
  description = "Map of name values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no name are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "data_loss_prevention_discovery_configs_org_config" {
  description = "Map of org_config values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no org_config are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => one(v.org_config) if v.org_config != null && length(v.org_config) > 0 }
}
output "data_loss_prevention_discovery_configs_other_cloud_starting_location" {
  description = "Map of other_cloud_starting_location values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no other_cloud_starting_location are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => one(v.other_cloud_starting_location) if v.other_cloud_starting_location != null && length(v.other_cloud_starting_location) > 0 }
}
output "data_loss_prevention_discovery_configs_parent" {
  description = "Map of parent values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no parent are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.parent if v.parent != null && length(v.parent) > 0 }
}
output "data_loss_prevention_discovery_configs_status" {
  description = "Map of status values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no status are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.status if v.status != null && length(v.status) > 0 }
}
output "data_loss_prevention_discovery_configs_targets" {
  description = "Map of targets values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no targets are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.targets if v.targets != null && length(v.targets) > 0 }
}
output "data_loss_prevention_discovery_configs_update_time" {
  description = "Map of update_time values across all data_loss_prevention_discovery_configs, keyed the same as var.data_loss_prevention_discovery_configs except keys with no update_time are omitted"
  value       = { for k, v in google_data_loss_prevention_discovery_config.data_loss_prevention_discovery_configs : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

