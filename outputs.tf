output "logic_app_trigger_recurrences_id" {
  description = "Map of id values across all logic_app_trigger_recurrences, keyed the same as var.logic_app_trigger_recurrences"
  value       = { for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : k => v.id if v.id != null && length(v.id) > 0 }
}
output "logic_app_trigger_recurrences_frequency" {
  description = "Map of frequency values across all logic_app_trigger_recurrences, keyed the same as var.logic_app_trigger_recurrences"
  value       = { for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : k => v.frequency if v.frequency != null && length(v.frequency) > 0 }
}
output "logic_app_trigger_recurrences_interval" {
  description = "Map of interval values across all logic_app_trigger_recurrences, keyed the same as var.logic_app_trigger_recurrences"
  value       = { for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : k => v.interval if v.interval != null }
}
output "logic_app_trigger_recurrences_logic_app_id" {
  description = "Map of logic_app_id values across all logic_app_trigger_recurrences, keyed the same as var.logic_app_trigger_recurrences"
  value       = { for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : k => v.logic_app_id if v.logic_app_id != null && length(v.logic_app_id) > 0 }
}
output "logic_app_trigger_recurrences_name" {
  description = "Map of name values across all logic_app_trigger_recurrences, keyed the same as var.logic_app_trigger_recurrences"
  value       = { for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : k => v.name if v.name != null && length(v.name) > 0 }
}
output "logic_app_trigger_recurrences_schedule" {
  description = "Map of schedule values across all logic_app_trigger_recurrences, keyed the same as var.logic_app_trigger_recurrences"
  value       = { for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : k => v.schedule if v.schedule != null && length(v.schedule) > 0 }
}
output "logic_app_trigger_recurrences_start_time" {
  description = "Map of start_time values across all logic_app_trigger_recurrences, keyed the same as var.logic_app_trigger_recurrences"
  value       = { for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : k => v.start_time if v.start_time != null && length(v.start_time) > 0 }
}
output "logic_app_trigger_recurrences_time_zone" {
  description = "Map of time_zone values across all logic_app_trigger_recurrences, keyed the same as var.logic_app_trigger_recurrences"
  value       = { for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : k => v.time_zone if v.time_zone != null && length(v.time_zone) > 0 }
}

