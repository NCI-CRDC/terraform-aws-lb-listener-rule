module "lb_listener_rule" {
  source = "github.com/NCI-CTOS/terraform-aws-lb-listener-rule"

  condition_host_header  = ["my-app.my-domain.gov"]
  condition_path_pattern = ["/"]
  listener_arn           = aws_lb_listener.example.arn
  priority               = 99
  target_group_arn       = aws_lb_target_group.example.arn
}
