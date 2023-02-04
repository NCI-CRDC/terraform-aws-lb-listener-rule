module "lb_listener_rule" {
  source = ""

  app     = "my-app"
  env     = "prod"
  program = "ccdi"

  target_group_arn = aws_lb_target_group.example.arn
  condition_host_header = [ "my-app.my-domain.gov" ]
  condition_path_pattern = [ "/" ]
}


module "my_app_listener_rule" {
  source = "AustinCloudGuru/alb/aws//modules/alb-listener-rule"
  # You should pin the module to a specific version
  # version                   = "x.x.x"
  port               = "443"
  protocol           = "HTTPS"
  vpc_id             = "vpc-11111111111111111"
  listener_arn       = module.https-listener.listener_arn
  attach_certificate = true
  certificate_arn    = module.my-app-certificate.arn

  health_check = [{
    interval          = 60
    path              = "/"
    timeout           = 5
    healthy_threshold = 2
    port              = 443
    protocol          = "HTTPS"
    matcher           = 200
  }]
}
