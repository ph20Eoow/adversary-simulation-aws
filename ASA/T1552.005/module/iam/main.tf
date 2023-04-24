resource "aws_iam_role" "ec2-restricted-role" {
    name = "ec2-restricted-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid    = ""
            Principal = {
                Service = "ec2.amazonaws.com"
            }
        },
        ]
    })
    tags = {
      simulation = true
    }
}