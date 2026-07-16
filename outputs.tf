output "dev_test_schedules_id" {
  description = "Map of id values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "dev_test_schedules_daily_recurrence" {
  description = "Map of daily_recurrence values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.daily_recurrence if v.daily_recurrence != null && length(v.daily_recurrence) > 0 }
}
output "dev_test_schedules_hourly_recurrence" {
  description = "Map of hourly_recurrence values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.hourly_recurrence if v.hourly_recurrence != null && length(v.hourly_recurrence) > 0 }
}
output "dev_test_schedules_lab_name" {
  description = "Map of lab_name values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.lab_name if v.lab_name != null && length(v.lab_name) > 0 }
}
output "dev_test_schedules_location" {
  description = "Map of location values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.location if v.location != null && length(v.location) > 0 }
}
output "dev_test_schedules_name" {
  description = "Map of name values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.name if v.name != null && length(v.name) > 0 }
}
output "dev_test_schedules_notification_settings" {
  description = "Map of notification_settings values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.notification_settings if v.notification_settings != null && length(v.notification_settings) > 0 }
}
output "dev_test_schedules_resource_group_name" {
  description = "Map of resource_group_name values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "dev_test_schedules_status" {
  description = "Map of status values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.status if v.status != null && length(v.status) > 0 }
}
output "dev_test_schedules_tags" {
  description = "Map of tags values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "dev_test_schedules_task_type" {
  description = "Map of task_type values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.task_type if v.task_type != null && length(v.task_type) > 0 }
}
output "dev_test_schedules_time_zone_id" {
  description = "Map of time_zone_id values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.time_zone_id if v.time_zone_id != null && length(v.time_zone_id) > 0 }
}
output "dev_test_schedules_weekly_recurrence" {
  description = "Map of weekly_recurrence values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.weekly_recurrence if v.weekly_recurrence != null && length(v.weekly_recurrence) > 0 }
}

