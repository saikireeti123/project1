resource "aws_lb" "dev" {
  name                       = "dev-lb-tf"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.sg_id]
  subnets                    = var.subnets
  enable_deletion_protection = false
  tags = {
    Environment = "dev"
  }
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.dev.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dev-lb.arn
  }
}
resource "aws_lb_target_group" "dev-lb" {
  name     = "dev-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group_attachment" "devta" {
  count            = length(var.instances)
  target_group_arn = aws_lb_target_group.dev-lb.arn
  target_id        = var.instances[count.index]
  port             = 80
}
