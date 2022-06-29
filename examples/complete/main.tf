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
  source  = "skyfjell/install/flux"
  version = "1.0.1"
}

module "helm_repository" {
  source  = "skyfjell/helm-repository/flux"
  version = "1.0.1"

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
  source  = "skyfjell/git-repository/flux"
  version = "1.0.1"

  name = "helm-release-test"
  url  = "https://github.com/skyfjell/helm-chart-example.git"

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
