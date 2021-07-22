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

  source_kind = substr(local.source_name, 0, length(local.helm_prefix)) == local.helm_prefix ? "HelmRepository" : "Git Repository"
}

locals {
  release = {
    apiVersion = "helm.toolkit.fluxcd.io/v2beta1"
    kind       = "HelmRelease"
    metadata = {
      name      = local.name
      namespace = local.namespace
      # finalizers = ["finalizers.fluxcd.io"]
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
          valuesFile  = null
          valuesFiles = []
        }
      }
      releaseName = local.name
      # suspend            = false
      # maxHistory         = null
      # postRenderers      = null
      # serviceAccountName = null
      # storageNamespace   = null
      # targetNamespace    = null
      # timeout            = null
      # valuesFrom         = null
      # dependsOn          = []
      # install = {
      #   crds                     = null
      #   createNamespace          = null
      #   disableHooks             = null
      #   disableOpenAPIValidation = null
      #   disableWait              = null
      #   disableWaitForJobs       = null
      #   remediation = {
      #     ignoreTestFailures   = null
      #     remediateLastFailure = null
      #     retries              = null
      #   }
      #   replace  = null
      #   skipCRDs = null
      #   timeout  = null
      # }
      # kubeConfig = {
      #   secretRef = {
      #     name = null
      #   }
      # }
      # rollback = {
      #   cleanupOnFail      = null
      #   disableHooks       = null
      #   disableWait        = null
      #   disableWaitForJobs = null
      #   force              = null
      #   recreate           = null
      #   timeout            = null
      # }
      # test = {
      #   enable         = null
      #   ignoreFailures = null
      #   timeout        = null
      # }
      # uninstall = {
      #   disableHooks = null
      #   keepHistory  = null
      #   timeout      = null
      # }
      # upgrade = {
      #   cleanupOnFail            = null
      #   crds                     = null
      #   disableHooks             = null
      #   disableOpenAPIValidation = null
      #   disableWait              = null
      #   disableWaitForJobs       = null
      #   force                    = null
      #   preserveValues           = null
      #   remediation = {
      #     ignoreTestFailures   = null
      #     remediateLastFailure = null
      #     retries              = null
      #     strategy             = null
      #   }
      #   timeout = null
      # }
    }
  }
}

output "release" {
  value = local.release
}

# resource "kubernetes_manifest" "test" {
#   manifest = {
#     apiVersion = "helm.toolkit.fluxcd.io/v2beta1"
#     kind       = "HelmRelease"
#     metadata = {
#       name      = "redis"
#       namespace = "flux-system"
#     }
#     spec = {
#       chart = {
#         spec = {
#           chart    = "bitnami/redis"
#           interval = "30m0s"
#           sourceRef = {
#             apiVersion = "source.toolkit.fluxcd.io/v1beta1"
#             kind       = "HelmRepository"
#             name       = "helm-repository-bitnami"
#             namespace  = "flux-system"
#           }
#           valuesFile  = null
#           valuesFiles = []
#           version     = "*"
#         }
#       }
#       interval    = "30m0s"
#       releaseName = "redis"
#       values      = {}
#     }
#   }
# }


