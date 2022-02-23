variable "application_name" {
  type = string
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "subnets" {
  default = [
    {
      az     = "us-east-2a",
      prefix = "10.1.1.0/24"
    },
    {
      az     = "us-east-2b",
      prefix = "10.1.2.0/24"
    },
    {
      az     = "us-east-2c",
      prefix = "10.1.3.0/24"
    }
  ]
}

