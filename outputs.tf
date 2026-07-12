output "dev_test_schedules_id" {
  description = "Map of id values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.id }
}
output "dev_test_schedules_daily_recurrence" {
  description = "Map of daily_recurrence values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.daily_recurrence }
}
output "dev_test_schedules_hourly_recurrence" {
  description = "Map of hourly_recurrence values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.hourly_recurrence }
}
output "dev_test_schedules_lab_name" {
  description = "Map of lab_name values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.lab_name }
}
output "dev_test_schedules_location" {
  description = "Map of location values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.location }
}
output "dev_test_schedules_name" {
  description = "Map of name values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.name }
}
output "dev_test_schedules_notification_settings" {
  description = "Map of notification_settings values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.notification_settings }
}
output "dev_test_schedules_resource_group_name" {
  description = "Map of resource_group_name values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.resource_group_name }
}
output "dev_test_schedules_status" {
  description = "Map of status values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.status }
}
output "dev_test_schedules_tags" {
  description = "Map of tags values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.tags }
}
output "dev_test_schedules_task_type" {
  description = "Map of task_type values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.task_type }
}
output "dev_test_schedules_time_zone_id" {
  description = "Map of time_zone_id values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.time_zone_id }
}
output "dev_test_schedules_weekly_recurrence" {
  description = "Map of weekly_recurrence values across all dev_test_schedules, keyed the same as var.dev_test_schedules"
  value       = { for k, v in azurerm_dev_test_schedule.dev_test_schedules : k => v.weekly_recurrence }
}

