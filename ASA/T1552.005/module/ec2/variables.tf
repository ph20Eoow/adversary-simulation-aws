variable "instance_type" {
  type = string
  description = "EC2 instance type for Windows"
  default = "t2.micro"
}

variable "association_public_ip_address" {
    type = bool
    description = "Associate a public IP to the instance"
    default = false
}

variable "root_vol_size" {
    type = number
    description = "Volume size of root volume"
    default = 30
}

variable "data_vol_size" {
    type = number
    description = "Volume size of data volume"
    default = 10
}

variable "root_vol_type" {
    type = string
    description = "Volume type of the rool volume"
    default = "gp2"
}

variable "data_vol_type" {
    type = string
    description = "Volume type of the data volume"
    default = "gp2"
}

variable "instance_name" {
    type = string
    description = "EC2 instance name"
    default = "asatfwinsrv"
}

variable "aws_az" {
    type = string
    description = "AWS AZ"
    default = "us-west-2a"
}

variable "vpc_cidr" {
    type = string
    description = "CIDR for VPC"
    default = "10.1.64.0/18"
}

variable "public_subnet_cidr" {
    type = string
    description = "CIDR for public subnet"
    default = "10.1.64.0/24"
}