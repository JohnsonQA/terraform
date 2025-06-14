resource "aws_instance" "roboshop"{
    count = 3
    ami             = var.ami_id
    instance_type   = var.environment == "dev" ? "t3.micro" : "t3.small"
    vpc_security_group_ids= [aws_security_group.allow_all.id]

    tags = {
     Name = var.instances[count.index]
    }

    provisioner "local-exec"{
        command = "echo ${self.private_ip} > inventory"
        on_failure = continue    #Though any errors code continues to execute
    }
    #usually provisioner runs on creation time not destroying. If need to run on destroy time then give when = destroy
    provisioner "local-exec"{
        command = "echo 'Destroyed the instances'"
        when = destroy   #Though any errors code continues to execute
    }
    #Connecting to remote server and installing and start nginx and stop while destroying
    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx"
    ]
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