resource "aws_instance" "roboshop"{
    ami             ="ami-09c813fb71547fc4f"
    instance_type   = "t3.micro"
    vpc_security_group_ids= [aws_security_group.allow_all.id]

    tags = {
     Name = "roboshop"
    }
}


resource "aws_security_group" "allow_all" {
    name        = "allow_all"
    description = "allow all traffic"

    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"   #It indicates all traffic
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    #Using lifecycle it will create new resource and associate with dependant r4esource. Here ec2 and then detsroy the old one  
    lifecycle {
        create_before_destroy = true
    }

    tags = {
        Name = "allow-all"
    }
}