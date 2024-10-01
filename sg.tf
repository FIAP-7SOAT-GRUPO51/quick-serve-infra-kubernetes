resource "aws_security_group" "sg" {
  name        = "SG-${var.projectName}"
  description = "Usado no EKS QUICK SERVE"
  vpc_id      = ""

  # Inbound
  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound
  egress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}