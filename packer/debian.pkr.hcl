packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "POSTGRES_USER" {
  type = string
}

variable "POSTGRES_PASSWORD" {
  type = string
}

variable "POSTGRES_HOST" {
  type = string
}

variable "POSTGRES_PORT" {
  type = string
}

variable "POSTGRES_DB" {
  type = string
}

variable "ami_users" {
  type    = list(string)
  default = ["434369415270", "610018956402"]
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "source_ami" {
  type    = string
  default = "ami-06db4d78cb1d3bbf9"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_username" {
  type    = string
  default = "admin"
}

variable "subnet_id" {
  type    = string
  default = "subnet-046f10d11e4a68ac0"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0f93b32042daa6131"
}

variable "ami_name" {
  type    = string
  default = "webapp-ami"
}
variable "environment" {
  type    = string
  default = "dev"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "debian" {
  profile       = "packer"
  ami_name      = "${var.ami_name}-${local.timestamp}"
  ami_users     = "${var.ami_users}"
  instance_type = "${var.instance_type}"
  region        = "${var.region}"
  source_ami    = "${var.source_ami}"
  ssh_username  = "${var.ssh_username}"
  subnet_id     = "${var.subnet_id}"
  tags = {
    Name        = "${var.ami_name}-${local.timestamp}"
    Environment = "${var.environment}"
  }
  vpc_id = "${var.vpc_id}"

  launch_block_device_mappings {
    device_name           = "/dev/xvda"
    delete_on_termination = true
  }
}

build {
  sources = [
    "source.amazon-ebs.debian"
  ]

  provisioner "file" {
    source      = "../webapp"
    destination = "/home/admin/webapp"
  }

  provisioner "shell" {
    script           = "packer/provision.sh"
    environment_vars = ["POSTGRES_USER=${var.POSTGRES_USER}", "POSTGRES_PASSWORD=${var.POSTGRES_PASSWORD}", "POSTGRES_HOST=${var.POSTGRES_HOST}", "POSTGRES_PORT=${var.POSTGRES_PORT}", "POSTGRES_DB=${var.POSTGRES_DB}"]
  }
}
