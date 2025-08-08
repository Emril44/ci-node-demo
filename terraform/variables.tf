variable "aws_region" {
    default = "us-east-1"
}

variable "ami_id" {
    default = "ami-021bf0bba3a411792"
}

variable "public_key_path" {
    description = "Path to the SSH public key for EC2 access"
    type = string
    default = "/home/emril/devops-key.pub"
}