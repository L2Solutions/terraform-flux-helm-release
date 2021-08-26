locals {
  name             = var.name
  namespace        = var.namespace
  chart            = var.chart
  version          = var.chart_version
  source_name      = var.source_name
  source_namespace = var.source_namespace == null ? var.namespace : var.source_namespace
  values           = var.values

  # TODO: Prefix modules
  helm_prefix = "helm-repository-"
}

locals {
  interval = var.interval == null ? local.source_kind == "HelmRepository" ? "30m0s" : "5m0s" : var.interval

  source_kind = substr(local.source_name, 0, length(local.helm_prefix)) == local.helm_prefix ? "HelmRepository" : "GitRepository"
}

locals {
  release = {
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
          chart    = local.chart
          version  = local.version
          interval = local.interval
          sourceRef = {
            apiVersion = "source.toolkit.fluxcd.io/v1beta1"
            kind       = local.source_kind
            name       = local.source_name
            namespace  = local.source_namespace
          }
        }
      }
      releaseName = local.name
    }
  }
}
