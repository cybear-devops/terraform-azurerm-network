variable "location" {
  type        = string
  description = "The Location (region) this resource should be put in (ie: uksouth)"
}

variable "rg_name" {
  description = "The name of the Resource Group, this module does not create a resource group, it is expecting the value of a resource group already exists"
  type        = string
  validation {
    condition     = length(var.rg_name) > 1 && length(var.rg_name) <= 24
    error_message = "Resource Group Name is not valid"
  }
}

variable "tags" {
  type        = map(string)
  description = "A map of the Tags to use on the resources that are deployed with this module"
}
