output "alb_dns" {
  value = aws_lb.alb.dns_name
}

output "website_bucket" {
  value = aws_s3_bucket.website.bucket
}
