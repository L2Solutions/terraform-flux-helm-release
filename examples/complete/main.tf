provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-tftest"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "k3d-tftest"
  }
}

module "flux_install" {
  source  = "OmniTeqSource/install/flux"
  version = "0.2.0"
}

module "helm_repository" {
  source  = "OmniTeqSource/helm-repository/flux"
  version = "0.2.3"

  name = "helm-repository-bitnami"
  url  = "https://charts.bitnami.com/"

  # This will prevent a condition where the namespace cannot be removed if a CR for a CRD still exists.
  depends_on = [module.flux_install]
}

module "helm_release_helm" {
  source = "../../"

  name  = "redis"
  chart = "bitnami/redis"

  source_ref = {
    name = module.helm_repository.name
  }

  depends_on = [module.helm_repository]
}

module "git_repository" {
  source  = "OmniTeqSource/git-repository/flux"
  version = "0.2.2"

  name = "helm-release-test"
  url  = "https://github.com/OmniTeqSource/helm-chart-example.git"

  # This will prevent a condition where the namespace cannot be removed if a CR for a CRD still exists.
  depends_on = [module.flux_install]
}

module "helm_release_git" {
  source = "../../"

  name  = "helm-release-git"
  chart = "chart"

  source_ref = {
    name = module.git_repository.name
    kind = "GitRepository"
  }
}
