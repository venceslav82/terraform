output "public_ip" {
  value = aws_instance.venci-server.*.public_ip
} 