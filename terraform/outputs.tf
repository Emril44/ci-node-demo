output "instance_ip" {
    description = "Public IP of EC2 instance"
    value = aws_instance.nodeapp_server.public_ip
}