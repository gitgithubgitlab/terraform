

data "aws_iam_policy_document" "eb_policy" {
  statement {
    effect = "Allow"
    actions = [
      "elasticbeanstalk:*",
      "ec2:*",
      "s3:*",
      "cloudformation:*",
      "autoscaling:*",
      "cloudwatch:*",
      "sns:*",
      "elasticloadbalancing:*",
      "iam:PassRole"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role" "eb_role" {
  name               = "aws-elasticbeanstalk-ec2-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "eb_policy_attachment" {
  role       = aws_iam_role.eb_role.name
  policy_arn = aws_iam_policy.eb_policy.arn
}

resource "aws_iam_policy" "eb_policy" {
  name        = "aws-elasticbeanstalk-ec2-policy"
  description = "Policy for Elastic Beanstalk EC2 instances"
  policy      = data.aws_iam_policy_document.eb_policy.json
}

resource "aws_iam_instance_profile" "eb_instance_profile" {
  name = "aws-elasticbeanstalk-ec2-instance-profile"
  role = aws_iam_role.eb_role.name
}

