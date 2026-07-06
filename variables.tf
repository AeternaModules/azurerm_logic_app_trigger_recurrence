variable "logic_app_trigger_recurrences" {
  description = <<EOT
Map of logic_app_trigger_recurrences, attributes below
Required:
    - frequency
    - interval
    - logic_app_id
    - name
Optional:
    - start_time
    - time_zone
    - schedule (block):
        - at_these_hours (optional)
        - at_these_minutes (optional)
        - on_these_days (optional)
EOT

  type = map(object({
    frequency    = string
    interval     = number
    logic_app_id = string
    name         = string
    start_time   = optional(string)
    time_zone    = optional(string)
    schedule = optional(object({
      at_these_hours   = optional(set(number))
      at_these_minutes = optional(set(number))
      on_these_days    = optional(set(string))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.logic_app_trigger_recurrences : (
        contains(["Month", "Week", "Day", "Hour", "Minute", "Second"], v.frequency)
      )
    ])
    error_message = "must be one of: Month, Week, Day, Hour, Minute, Second"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_trigger_recurrences : (
        v.schedule == null || (v.schedule.at_these_hours == null || (v.schedule.at_these_hours >= 0 && v.schedule.at_these_hours <= 23))
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_trigger_recurrences : (
        v.schedule == null || (v.schedule.at_these_minutes == null || (v.schedule.at_these_minutes >= 0 && v.schedule.at_these_minutes <= 59))
      )
    ])
    error_message = "must be between 0 and 59"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_trigger_recurrences : (
        v.schedule == null || (v.schedule.on_these_days == null || (contains(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], v.schedule.on_these_days)))
      )
    ])
    error_message = "must be one of: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_logic_app_trigger_recurrence's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: logic_app_id
  #   source:    [from workflows.ValidateWorkflowID] !ok
  # path: logic_app_id
  #   source:    [from workflows.ValidateWorkflowID] err != nil
  # path: start_time
  #   source:    validation.IsRFC3339Time(...) - no translation rule yet, add one
  # path: time_zone
  #   source:    validate.TriggerRecurrenceTimeZone: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
}

