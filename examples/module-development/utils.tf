data "http" "client_ip" {
  url = "https://checkip.amazonaws.com"
}

variable "Regions" {
  type = map(string)
  default = {
    uks = "UK South"
    ukw = "UK West"
    eus = "East US"
    euw = "West Europe"
  }
  description = "Converts shorthand name to longhand name via lookup on map list"
}

locals {
  location = lookup(var.Regions, var.loc, "UK South")
}

data "external" "detect_os" {
  working_dir = path.module
  program     = ["printf", "{\"os\": \"Linux\"}"]
}

#resource "random_string" "entropy" {
#  length  = 4
#  special = false
#}