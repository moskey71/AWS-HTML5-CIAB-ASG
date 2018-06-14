output "URL" {
  value = "https://${aws_acm_certificate.cert.domain_name}/guacamole"
}
