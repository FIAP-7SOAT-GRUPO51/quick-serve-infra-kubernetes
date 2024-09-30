resource "aws_security_group" "sg" {
  name        = "SG-${var.projectName}"
  description = "Usado no EKS QUICK SERVE"
  vpc_id      = ""

  # Inbound
  ingress {
    description = "HTTP"
    from_port   = 30081
    to_port     = 30081
    protocol    = "tcp"
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