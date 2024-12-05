# output "ami_id" {
#   value       = data.aws_ami.ami_info.id
  
# }
output "r53info" {
    value = aws_route53_record.route_info
}