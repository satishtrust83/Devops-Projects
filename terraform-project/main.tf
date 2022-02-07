module "aws_vpc_configuration" {
    source = "./modules/vpc"

}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}



resource "aws_instance" "ec2_public_subnet_instances" {
    
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    key_name = var.key_name # note that key name is exist in aws
    count = length(module.aws_vpc_configuration.public_network_interface_ids)
    availability_zone = module.aws_vpc_configuration.public_availability_zones[count.index]
    network_interface {
          network_interface_id = module.aws_vpc_configuration.public_network_interface_ids[count.index]
	 device_index = 0
    }
    
    tags = {
        Name = "Terraform_public_instance_${count.index}"
    }
    user_data = file("install.sh")
}


resource "aws_instance" "ec2_private_subnet_instances" {
    
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    key_name = var.key_name
    count = length(module.aws_vpc_configuration.private_network_interface_ids)
    availability_zone = module.aws_vpc_configuration.private_availability_zones[count.index]
    network_interface {
          network_interface_id = module.aws_vpc_configuration.private_network_interface_ids[count.index]
	 device_index = 0
    }
    
    tags = {
        Name = "Terraform_private_instance_${count.index}"
    }
    user_data = file("install.sh")
}

