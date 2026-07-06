output "dev_test_schedules" {
  description = "All dev_test_schedule resources"
  value       = azurerm_dev_test_schedule.dev_test_schedules
}
output "dev_test_schedules_daily_recurrence" {
  description = "List of daily_recurrence values across all dev_test_schedules"
  value       = [for k, v in azurerm_dev_test_schedule.dev_test_schedules : v.daily_recurrence]
}
output "dev_test_schedules_hourly_recurrence" {
  description = "List of hourly_recurrence values across all dev_test_schedules"
  value       = [for k, v in azurerm_dev_test_schedule.dev_test_schedules : v.hourly_recurrence]
}
output "dev_test_schedules_lab_name" {
  description = "List of lab_name values across all dev_test_schedules"
  value       = [for k, v in azurerm_dev_test_schedule.dev_test_schedules : v.lab_name]
}
output "dev_test_schedules_location" {
  description = "List of location values across all dev_test_schedules"
  value       = [for k, v in azurerm_dev_test_schedule.dev_test_schedules : v.location]
}
output "dev_test_schedules_name" {
  description = "List of name values across all dev_test_schedules"
  value       = [for k, v in azurerm_dev_test_schedule.dev_test_schedules : v.name]
}
output "dev_test_schedules_notification_settings" {
  description = "List of notification_settings values across all dev_test_schedules"
  value       = [for k, v in azurerm_dev_test_schedule.dev_test_schedules : v.notification_settings]
}
output "dev_test_schedules_resource_group_name" {
  description = "List of resource_group_name values across all dev_test_schedules"
  value       = [for k, v in azurerm_dev_test_schedule.dev_test_schedules : v.resource_group_name]
}
output "dev_test_schedules_status" {
  description = "List of status values across all dev_test_schedules"
  value       = [for k, v in azurerm_dev_test_schedule.dev_test_schedules : v.status]
}
output "dev_test_schedules_tags" {
  description = "List of tags values across all dev_test_schedules"
  value       = [for k, v in azurerm_dev_test_schedule.dev_test_schedules : v.tags]
}
output "dev_test_schedules_task_type" {
  description = "List of task_type values across all dev_test_schedules"
  value       = [for k, v in azurerm_dev_test_schedule.dev_test_schedules : v.task_type]
}
output "dev_test_schedules_time_zone_id" {
  description = "List of time_zone_id values across all dev_test_schedules"
  value       = [for k, v in azurerm_dev_test_schedule.dev_test_schedules : v.time_zone_id]
}
output "dev_test_schedules_weekly_recurrence" {
  description = "List of weekly_recurrence values across all dev_test_schedules"
  value       = [for k, v in azurerm_dev_test_schedule.dev_test_schedules : v.weekly_recurrence]
}

