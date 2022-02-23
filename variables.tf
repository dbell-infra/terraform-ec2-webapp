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

variable "application_name" {
  default = "example-webapp"
}

variable "frontend_port" {
  default = "80"
}

variable "backend_port" {
  default = 8000
}

variable "autoscaling" {
  default = {
    az_min = 1
    az_max = 1
    az_desired = 1
  }
}