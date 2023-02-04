variable "condition_host_header" {
  type        = list(string)
  description = "contains a single value item which is a list of host header patterns to match"
  default     = []
}

variable "condition_path_pattern" {
  type        = list(string)
  description = "Contains a single value item which is a list of path patterns to match against the request URL"
  default     = []
}

variable "listener_arn" {
  type        = string
  description = "arn of the load balancer listener to forward traffic from"
}

variable "priority" {
  type        = number
  description = "priority for the rule between 1 and 50000 - higher value means higher priority"
}

variable "target_group_arn" {
  type        = string
  description = "arn of the target group to forward traffic to"
}
