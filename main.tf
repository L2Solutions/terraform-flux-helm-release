resource "random_string" "this" {
  keepers = {
    # Using `var.name` is required here to prevent cyclic dependency.
    name = var.name
  }

  upper   = false
  special = false
  length  = 8
}

resource "helm_release" "this" {
  name       = local.name
  repository = "https://skyfjell.github.io/charts"
  chart      = "null"
  values     = [yamlencode({ manifests = [local.manifest] })]
}
