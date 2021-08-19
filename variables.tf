variable "name" {
  description = "Name of the release"
  type        = string
}

variable "namespace" {
  description = "Namespace the release belongs to(not deployed to)"
  default     = "flux-system"
  type        = string
}


variable "interval" {
  description = "Interval to check the repo for reconciliation"
  default     = null
  type        = string
}

variable "values" {
  description = "Values to apply to the release"
  default     = null
  type        = map(any)
}

variable "chart" {
  description = "Name of, or path to the chart"
  type        = string
}

variable "chart_version" {
  description = "Version of the chart"
  default     = "*"
  type        = string
}

variable "source_name" {
  description = "HelmRepository or GitRepository source name"
  type        = string
}

variable "source_namespace" {
  description = "Namespace of the source repository"
  default     = null
  type        = string
}
