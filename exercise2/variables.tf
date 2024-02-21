variable "REGION" {
  default = "us-east-2"

}

variable "ZONE1" {
  default = "us-east-2a"

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

