variable "regionDefault" {
  default = "us-east-1"
}

variable "projectName" {
  default = "EKS-QUICK-SERVE"
}

variable "labRole" {
  default = "arn:aws:iam::151993598287:role/LabRole"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "nodeGroup" {
  default = "quick-serve"
}

variable "instanceType" {
  default = "t3.medium"
}

variable "principalArn" {
  default = "arn:aws:iam::151993598287:role/voclabs"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminPolicy"
}