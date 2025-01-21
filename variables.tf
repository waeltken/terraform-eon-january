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
