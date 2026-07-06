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
        v.weekly_recurrence == null || (can(regex("^(0[0-9]|1[0-9]|2[0-3]|[0-9])[0-5][0-9]$", v.weekly_recurrence.time)))
      )
    ])
    error_message = "Time of day must match the format HHmm where HH is 00-23 and mm is 00-59"
  }
  validation {
    condition = alltrue([
      for k, v in var.dev_test_schedules : (
        v.weekly_recurrence == null || (v.weekly_recurrence.week_days == null || (contains(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], v.weekly_recurrence.week_days)))
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
  # --- Unconfirmed validation candidates, derived from azurerm_dev_test_schedule's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: lab_name
  #   source:    devTestValidate.DevTestLabName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: status
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: time_zone_id
  #   source:    computeValidate.VirtualMachineTimeZoneCaseInsensitive: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: notification_settings.status
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

