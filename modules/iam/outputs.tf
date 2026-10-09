<<<<<<< HEAD
=======
output "ec2_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}

>>>>>>> b58dcd0 ( nodejs update)
output "beanstalk_service_role_arn" {
  value = aws_iam_role.beanstalk_service_role.arn
}

output "beanstalk_ec2_instance_profile_name" {
  value = aws_iam_instance_profile.beanstalk_ec2_profile.name
}
