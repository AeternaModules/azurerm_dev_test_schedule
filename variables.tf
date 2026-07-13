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
    status              = optional(string)
    tags                = optional(map(string))
    notification_settings = object({
      status          = optional(string)
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
  validation {
    condition = alltrue([
      for k, v in var.dev_test_schedules : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.dev_test_schedules : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.dev_test_schedules : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.dev_test_schedules : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.dev_test_schedules : (
        v.weekly_recurrence == null || (can(regex("^(0[0-9]|1[0-9]|2[0-3]|[0-9])[0-5][0-9]$", v.weekly_recurrence.time)))
      )
    ])
    error_message = "Time of day must match the format HHmm where HH is 00-23 and mm is 00-59"
  }
  validation {
    condition = alltrue([
      for k, v in var.dev_test_schedules : (
        v.weekly_recurrence == null || (v.weekly_recurrence.week_days == null || (alltrue([for x in v.weekly_recurrence.week_days : contains(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], x)])))
      )
    ])
    error_message = "must be one of: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday"
  }
  validation {
    condition = alltrue([
      for k, v in var.dev_test_schedules : (
        v.daily_recurrence == null || (can(regex("^(0[0-9]|1[0-9]|2[0-3]|[0-9])[0-5][0-9]$", v.daily_recurrence.time)))
      )
    ])
    error_message = "Time of day must match the format HHmm where HH is 00-23 and mm is 00-59"
  }
  validation {
    condition = alltrue([
      for k, v in var.dev_test_schedules : (
        v.hourly_recurrence == null || (v.hourly_recurrence.minute >= 0 && v.hourly_recurrence.minute <= 59)
      )
    ])
    error_message = "must be between 0 and 59"
  }
  validation {
    condition = alltrue([
      for k, v in var.dev_test_schedules : (
        v.notification_settings.time_in_minutes == null || (v.notification_settings.time_in_minutes >= 1)
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.dev_test_schedules : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

