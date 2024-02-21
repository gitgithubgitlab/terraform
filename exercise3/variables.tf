variable "REGION" {
  default = "us-east-2"

}

variable "MYIP" {
  default = "122.164.84.4/32"

}

variable "ZONE1" {
  default = "us-east-2a"

}

variable "ZONE2" {
  default = "us-east-2b"

}

variable "ZONE3" {
  default = "us-east-2c"

}

variable "USER" {
  default = "ec2-user"

}

variable "AMIS" {
  type = map(any)

  default = {
    "us-east-2" = "ami-09694bfab577e90b0"
    "us-west-2" = "ghj"
  }


}

