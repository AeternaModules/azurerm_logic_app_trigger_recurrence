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
}

