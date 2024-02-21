variable "REGION" {
  default = "us-east-2"

}

variable "AMIS" {
  type = map(any)

  default = {
    "us-east-2" = "ami-07b36ea9852e986ad"
    "us-east-1" = "ami-07b36ea9852e986ab123"

  }
}

variable "USERNAME" {
  default = "ubuntu"

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

variable "MYIP" {
  default = "122.164.84.242/32"

}

variable "rmquser" {
  default = "rabbit"

}

variable "rmqpass" {
  default = "Gr33n@pple123456"

}

variable "dbuser" {
  default = "admin"

}

variable "dbpass" {
  default = "admin123"

}

variable "dbname" {
  default = "accounts"

}

variable "instance_count" {
  default = 1

}

variable "VPC_NAME" {
  default = "vprofile-VPC"

}

variable "VpcCIDR" {
  default = "172.21.0.0/16"

}

variable "PubSub1CIDR" {
  default = "172.21.1.0/24"

}

variable "PubSub2CIDR" {
  default = "172.21.2.0/24"

}

variable "PubSub3CIDR" {
  default = "172.21.3.0/24"

}

variable "PrivSub1CIDR" {
  default = "172.21.4.0/24"

}

variable "PrivSub2CIDR" {
  default = "172.21.5.0/24"

}

variable "PrivSub3CIDR" {
  default = "172.21.6.0/24"

}


