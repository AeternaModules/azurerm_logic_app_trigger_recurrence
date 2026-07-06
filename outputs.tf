output "logic_app_trigger_recurrences" {
  description = "All logic_app_trigger_recurrence resources"
  value       = azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences
}
output "logic_app_trigger_recurrences_frequency" {
  description = "List of frequency values across all logic_app_trigger_recurrences"
  value       = [for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : v.frequency]
}
output "logic_app_trigger_recurrences_interval" {
  description = "List of interval values across all logic_app_trigger_recurrences"
  value       = [for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : v.interval]
}
output "logic_app_trigger_recurrences_logic_app_id" {
  description = "List of logic_app_id values across all logic_app_trigger_recurrences"
  value       = [for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : v.logic_app_id]
}
output "logic_app_trigger_recurrences_name" {
  description = "List of name values across all logic_app_trigger_recurrences"
  value       = [for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : v.name]
}
output "logic_app_trigger_recurrences_schedule" {
  description = "List of schedule values across all logic_app_trigger_recurrences"
  value       = [for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : v.schedule]
}
output "logic_app_trigger_recurrences_start_time" {
  description = "List of start_time values across all logic_app_trigger_recurrences"
  value       = [for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : v.start_time]
}
output "logic_app_trigger_recurrences_time_zone" {
  description = "List of time_zone values across all logic_app_trigger_recurrences"
  value       = [for k, v in azurerm_logic_app_trigger_recurrence.logic_app_trigger_recurrences : v.time_zone]
}

