variable "ami_id" {
    type = string
    default= "ami-09c813fb71547fc4f"
    description= "AMI id for RHEL OS"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "ec2_tags" {
    type = map(string)
    default={
        Name= "var instance"
        purpose = "variables-demo"
    }
}

variable "sg_name" {
    default = "vars-file-allow-all"
}

variable "sg_description" {
    default = "allowing all ports from internet"
}

variable "from_port" {
    default = 0
}

variable "to_port" {
    type = number
    default = 0
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    default = {
        Name = "allow-all"  #here for map key should be same as key in the .tf file. Ex: Name
    }
}

variable "environment"{
    default = "dev"
}

variable "instances"{
   # default = ["mongodb", "catalogue", "redis"]
  default={
   mongodb = "t3.micro"  # each keyword is assigned for every iteration. you will get each.key and each.value
   catalogue= "t3.micro"
   redis = "t3.micro"
  }
}

variable "zone_id"{
    default = "Z0565168946IP9W7JODJ"
}

variable "domain_name"{
    default = "roboshop.space"
}