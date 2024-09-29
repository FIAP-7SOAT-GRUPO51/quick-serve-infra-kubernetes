# IAM role for eks

resource "aws_iam_role" "eks-role" {
  name = "eks-cluster-role"
  tags = {
    tag-key = "eks-cluster-role"
  }

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "eks.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}

# eks policy attachment

resource "aws_iam_role_policy_attachment" "role-AmazonEKSClusterPolicy" {
  role       = aws_iam_role.eks-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_eks_cluster" "eks-cluster" {
  name     = var.projectName
  role_arn = aws_iam_role.eks-role.arn

  vpc_config {
    subnet_ids         = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.regionDefault}e"]
    security_group_ids = [aws_security_group.sg.id]
  }

  access_config {
    authentication_mode = var.accessConfig
  }

  depends_on = [aws_iam_role_policy_attachment.role-AmazonEKSClusterPolicy]

}