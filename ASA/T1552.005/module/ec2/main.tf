# Create security group
resource "aws_security_group" "windows-sg" {
  name = "T1552-005"
  description = "Allow rdp incoming connection"
  vpc_id = aws_vpc.vpc.id

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow incoming RDP connections"
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
  } 

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags={
      name = "T1552-005"
  }
}

# Create ec2 instance
resource "aws_instance" "windows-server" {
    ami = data.aws_ami.windows-2022.id
    instance_type = var.instance_type
    monitoring = true
    key_name = aws_key_pair.key_pair.key_name
    subnet_id = aws_subnet.public-subnet.id
    vpc_security_group_ids = [ aws_security_group.windows-sg.id ]
    associate_public_ip_address = var.association_public_ip_address
    tags = {
      Name = "T1552-005-vm"
      Environment = "Dev"
    }
}