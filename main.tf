resource "kubernetes_manifest" "this" {
  provider = kubernetes-alpha

  manifest = local.release
}