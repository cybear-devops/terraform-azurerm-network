locals {
  dynamic_tags = {
    "LastUpdated" = data.external.generate_timestamp.result["timestamp"]
    "Environment" = var.env
  }

  os   = data.external.detect_os.result.os
  tags = merge(var.static_tags, local.dynamic_tags)
}

data "external" "generate_timestamp" {
  program = local.os == "Linux" ? ["${path.module}/timestamp.sh"] : ["powershell", "${path.module}/timestamp.ps1"]
}

variable "static_tags" {
  type        = map(string)
  description = "The tags variable"
  default = {
    "Owner"           = "cybear-devops"
    "ServiceCategory" = "A"
    "CostCentre"      = "112233"
    "ManagedBy"       = "Terraform"
    "Contact"         = "cybear-devops@btinternet.com"
  }
}
