variable "region" {
  description = "The region in which the resources will be deployed"
  default     = "germanywestcentral"
  type        = string
}

variable "additional_tags" {
  description = "Additional tags to be applied to all resources"
  type        = map(string)
  default     = {}
}

variable "stage" {
  description = "The stage of the environment"
  type        = string
  default     = "prod"
  validation {
    condition     = can(regex("^(dev|staging|prod)$", var.stage))
    error_message = "Stage must be dev, staging, or prod"
  }
}
