variable "region"{
    type = string
    default = "ap-south-1"

}

variable "aws_profile"{
    type = string
    default = "terraform-test"
}


variable "ami" {
    type = string
    default = "ami-0851b76e8b1bce90b"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "key_name" {
    type = string
    default = "test"    
}

variable "instance_count" {
    type = number
    default = 2
}

