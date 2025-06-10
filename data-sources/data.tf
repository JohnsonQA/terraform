data "aws_ami" "joindevops"{
    owners           = ["973714476881"]  #more options to filter the ami like owner id
    most_recent      = true    #latest version of the ami

    filter{
        name = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }
    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

}

output "ami_id" {
  value       = data.aws_ami.joindevops.id
}