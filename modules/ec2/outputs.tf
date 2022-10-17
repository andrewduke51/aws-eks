output "public_address" {
  value = aws_instance.master.*.public_ip
}