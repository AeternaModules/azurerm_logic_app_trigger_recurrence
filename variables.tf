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
        v.schedule == null || (v.schedule.at_these_hours == null || (alltrue([for x in v.schedule.at_these_hours : x >= 0 && x <= 23])))
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_trigger_recurrences : (
        v.schedule == null || (v.schedule.at_these_minutes == null || (alltrue([for x in v.schedule.at_these_minutes : x >= 0 && x <= 59])))
      )
    ])
    error_message = "must be between 0 and 59"
  }
  validation {
    condition = alltrue([
      for k, v in var.logic_app_trigger_recurrences : (
        v.schedule == null || (v.schedule.on_these_days == null || (alltrue([for x in v.schedule.on_these_days : contains(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], x)])))
      )
    ])
    error_message = "must be one of: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

