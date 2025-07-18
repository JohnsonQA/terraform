#Once we hit the command terraform import aws_instance.linux <InstanceID>
#State file would be created with the instance details
#Then we can update in our.tf file with all the details
#Now it's a native terraform instance creation with all the details

resource "aws_instance" "linux" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-035143f391bb55883"]

  tags = {
    Name = "linux-change"
  }
}