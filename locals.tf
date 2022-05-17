locals {
  name      = var.random_suffix ? join("-", [var.name, random_string.this.id]) : var.name
  namespace = var.namespace
  chart     = var.chart
  version   = var.chart_version
  values    = var.values

  source_ref = defaults(var.source_ref, {
    kind = "HelmRepository"
  })

  # TODO: Prefix modules
  helm_prefix = "helm-repository-"
}

locals {
  interval = var.interval
}

locals {
  manifest = {
    apiVersion = "helm.toolkit.fluxcd.io/v2beta1"
    kind       = "HelmRelease"
    metadata = {
      name       = local.name
      namespace  = local.namespace
      finalizers = ["finalizers.fluxcd.io"]
    }
    spec = {
      values   = local.values
      interval = local.interval
      chart = {
        spec = {
          chart     = local.chart
          version   = local.version
          interval  = local.interval
          sourceRef = local.source_ref
        }
      }
      releaseName = local.name
    }
  }
}
