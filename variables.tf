variable "dev_test_schedules" {
  description = <<EOT
Map of dev_test_schedules, attributes below
Required:
    - lab_name
    - location
    - name
    - resource_group_name
    - task_type
    - time_zone_id
    - notification_settings (block):
        - status (optional)
        - time_in_minutes (optional)
        - webhook_url (optional)
Optional:
    - status
    - tags
    - daily_recurrence (block):
        - time (required)
    - hourly_recurrence (block):
        - minute (required)
    - weekly_recurrence (block):
        - time (required)
        - week_days (optional)
EOT

  type = map(object({
    lab_name            = string
    location            = string
    name                = string
    resource_group_name = string
    task_type           = string
    time_zone_id        = string
    status              = optional(string) # Default: "Disabled"
    tags                = optional(map(string))
    notification_settings = object({
      status          = optional(string) # Default: "Disabled"
      time_in_minutes = optional(number)
      webhook_url     = optional(string)
    })
    daily_recurrence = optional(object({
      time = string
    }))
    hourly_recurrence = optional(object({
      minute = number
    }))
    weekly_recurrence = optional(object({
      time      = string
      week_days = optional(list(string))
    }))
  }))
}

