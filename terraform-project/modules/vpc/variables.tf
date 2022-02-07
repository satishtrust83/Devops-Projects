variable "region"{
    type = string
    default = "ap-south-1"

}

variable "aws_profile"{
    type = string
    default = "terraform-test"
}

variable "vpc_name" {
    type = string
    default = "terraform-assignment-vpc"
}

variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/24"
}

variable "public_subnet_cidr_blocks" {
    type = list
    default = ["10.0.0.0/26", "10.0.0.64/26"]
}

variable "private_subnet_cidr_blocks" {
    type = list
    default = ["10.0.0.128/27"]
}


variable "public_subnet_ingress_rules" {
    type = list(object({
        from_port = number
        to_port = number
	protocol = string
        description = string
        cidr_blocks = list(string)
    }))

    default = [
        {from_port = 80, to_port = 80, protocol = "tcp", description = "HTTP Ports", cidr_blocks = ["0.0.0.0/0"]},
        {from_port = 22, to_port = 22, protocol = "tcp", description = "SSH Ports open to all", cidr_blocks = ["0.0.0.0/0"]}
    ]
}

variable "private_subnet_ingress_rules" {
    type = list(object({
        from_port = number
        to_port = number
	    protocol = string
        description = string
    }))

    default = [
        {from_port = 22, to_port = 22, protocol = "tcp", description = "SSH Ports only can be accessible from public subnet of this vpc"}
    ]
}


variable "availability_zone" { 
	type = string
	default = "ap-south-1b"
}
