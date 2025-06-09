resource "aws_instance" "roboshop"{
    for_each= var.instances   # In this case variable also should be initialize in map
    #for_each = toset(var.instances) # here we can have vars as list only
    ami             = var.ami_id
    #instance_type   = var.environment == "dev" ? "t3.micro" : "t3.small"
    instance_type = each.value
    vpc_security_group_ids= [aws_security_group.allow_all.id]

    tags = {
     #Name = var.instances[count.index]
     Name = each.key # each.key will automatically run a loop and get every key
    }
}


resource "aws_security_group" "allow_all" {
    name        = var.sg_name
    description = var.sg_description

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"   #It indicates all traffic
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.sg_tags
}