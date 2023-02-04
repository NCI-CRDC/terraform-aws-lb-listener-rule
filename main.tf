resource "aws_lb_listener_rule" "this" {
  listener_arn = var.listener_arn
  priority     = var.priority

  dynamic "action" {
    for_each = var.action_type == "forward" ? [1] : [0]
    
    content {
      type = var.action_type

      forward {
        stickiness {
          enabled  = var.forward_stickiness_enabled
          duration = var.forward_stickiness_duration
        }

        target_group {
          arn = var.target_group_arn
        }
      }
    }

  }

  condition {
    host_header {
      values = var.condition_host_header
    }
  }

  condition {
    path_pattern {
      values = var.condition_path_pattern
    }
  }
}

variable "condition_host_header" {
  type        = list()
  description = "matching host header values - supports '*' wildcards and is not case sensitive"
  default     = null
}

variable "condition_path_pattern" {
  type        = list(any)
  description = ""
  default     = ""
}