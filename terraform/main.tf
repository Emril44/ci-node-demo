provider "aws" {
    region = var.aws_region
}

resource "aws_security_group" "docker_sg" {
    name = "docker-sg"
    description = "Allow SSH and app traffic"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "nodeapp_server" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = "devops-key"
    security_groups = [aws_security_group.docker_sg.name]
    vpc_security_group_ids = [aws_security_group.docker_sg.id]
    associate_public_ip_address = true

    tags = {
        Name = "nodeapp-terraform"
    }
}