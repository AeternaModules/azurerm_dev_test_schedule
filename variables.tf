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
  # --- Unconfirmed validation candidates, derived from azurerm_dev_test_schedule's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
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
  # path: weekly_recurrence.time
  #   condition: can(regex("^(0[0-9]|1[0-9]|2[0-3]|[0-9])[0-5][0-9]$", value))
  #   message:   Time of day must match the format HHmm where HH is 00-23 and mm is 00-59
  # path: weekly_recurrence.week_days[*]
  #   condition: contains(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"], value)
  #   message:   must be one of: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
  # path: daily_recurrence.time
  #   condition: can(regex("^(0[0-9]|1[0-9]|2[0-3]|[0-9])[0-5][0-9]$", value))
  #   message:   Time of day must match the format HHmm where HH is 00-23 and mm is 00-59
  # path: hourly_recurrence.minute
  #   condition: value >= 0 && value <= 59
  #   message:   must be between 0 and 59
  # path: time_zone_id
  #   source:    computeValidate.VirtualMachineTimeZoneCaseInsensitive: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: notification_settings.status
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: notification_settings.time_in_minutes
  #   condition: value >= 1
  #   message:   must be at least 1
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

