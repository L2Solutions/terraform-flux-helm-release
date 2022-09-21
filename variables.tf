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
  default     = "5m0s"
  type        = string
}

variable "values" {
  description = "Values to apply to the release"
  default     = null
  type        = any
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

variable "source_ref" {
  description = "Object containing source configuration"
  type = object({
    name      = string
    namespace = optional(string, "flux-system")
    kind      = optional(string, "HelmRepository")
  })

  validation {
    condition     = var.source_ref.kind == null || contains(["HelmRepository", "GitRepository"], var.source_ref.kind == null ? "" : var.source_ref.kind)
    error_message = "Allowed values for `source.name` are `[\"HelmRepository\", \"GitRepository\"]`(defaults to `HelmRelease`)."
  }
}

variable "random_suffix" {
  description = "Add a random alpha-numeric suffix to resource names(prevents helm release collision)"
  default     = true
  type        = bool
}
