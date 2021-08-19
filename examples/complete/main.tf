provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-tftest"

  experiments {
    manifest_resource = true
  }
}

module "flux-install" {
  count   = 1
  source  = "L2Solutions/install/flux"
  version = ">= 0.0.27"
}

# Set to true after flux-install. GitRepository CRD need to be created before the repo instances may be created.
locals {
  install_complete = false
}


module "helm-repository" {
  count = local.install_complete ? 1 : 0

  source  = "L2Solutions/helm-repository/flux"
  version = "0.0.6"

  name = "helm-repository-bitnami"
  url  = "https://charts.bitnami.com/"

  # This will prevent a condition where the namespace cannot be removed if a CR for a CRD still exists.
  depends_on = [module.flux-install]
}

module "helm-release-helm" {
  count = local.install_complete ? 1 : 0

  source = "../../"

  name        = "redis"
  chart       = "bitnami/redis"
  source_name = "helm-repository-bitnami"

  depends_on = [module.helm-repository]
}

module "git-repository" {
  count = local.install_complete ? 1 : 0

  source  = "L2Solutions/git-repository/flux"
  version = "0.0.4"

  name = "helm-release-test"
  url  = "https://github.com/L2Solutions/helm-chart-example.git"

  # This will prevent a condition where the namespace cannot be removed if a CR for a CRD still exists.
  depends_on = [module.flux-install]
}

module "helm-release-git" {
  count = local.install_complete ? 1 : 0

  source = "../../"

  name        = "helm-release-git"
  chart       = "chart"
  source_name = "helm-release-test"
}
