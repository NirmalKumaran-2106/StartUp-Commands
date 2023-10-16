resource "aws_iam_role" "testrole" {
  name = "Test-Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}
resource "aws_iam_policy" "test-policy" {
    name = "Terraform-Policy"
    policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*"
        }]
    })
}
resource "aws_iam_role_policy_attachment" "test-policy-attachment" {
  role = aws_iam_role.testrole.id
  policy_arn = aws_iam_policy.test-policy.arn
}