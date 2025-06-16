
output "alb_dns_name" {
  value       = aws_lb.example.dns_name
  description = "The domain name of the load balancer"
}

output "ami_id" {
  value       = data.aws_ami.latest_amazon_linux.id
  description = "The AMI of the selected ec2 instance type"
}

