resource "aws_iam_role" "beanstalk_ec2" {
  name = "beanstalk_ec2"

  assume_role_policy = jsonencode({
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
})

}

resource "aws_iam_role_policy" "beanstalk_ec2_policy" {
  name = "beanstalk_ec2_policy"
  role = aws_iam_role.beanstalk_ec2.id

  policy = jsonencode(
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "cloudwatch:PutMetricData",
          "ds:CreateComputer",
          "ds:DescribeDirectories",
          "ec2:DescribeInstanceStatus",
          "logs:* ",
          "ssm:* ",
          "ec2messages:* ",
          "ecr:GetAuthorizationToken ",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DescribeImages ",
          "ecr:BatchGetImage",
          "s3:*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "beanstalk-ec2-profile" {
  name = "beanstalk_ec2_profile"
  role = aws_iam_role_policy.beanstalk_ec2_name

}

