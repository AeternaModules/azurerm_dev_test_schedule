resource "azurerm_dev_test_schedule" "dev_test_schedules" {
  for_each = var.dev_test_schedules

  lab_name            = each.value.lab_name
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  task_type           = each.value.task_type
  time_zone_id        = each.value.time_zone_id
  status              = each.value.status
  tags                = each.value.tags

  notification_settings {
    status          = each.value.notification_settings.status
    time_in_minutes = each.value.notification_settings.time_in_minutes
    webhook_url     = each.value.notification_settings.webhook_url
  }

  dynamic "daily_recurrence" {
    for_each = each.value.daily_recurrence != null ? [each.value.daily_recurrence] : []
    content {
      time = daily_recurrence.value.time
    }
  }

  dynamic "hourly_recurrence" {
    for_each = each.value.hourly_recurrence != null ? [each.value.hourly_recurrence] : []
    content {
      minute = hourly_recurrence.value.minute
    }
  }

  dynamic "weekly_recurrence" {
    for_each = each.value.weekly_recurrence != null ? [each.value.weekly_recurrence] : []
    content {
      time      = weekly_recurrence.value.time
      week_days = weekly_recurrence.value.week_days
    }
  }
}

