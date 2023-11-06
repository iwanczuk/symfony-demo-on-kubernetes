data "aws_eks_cluster" "default" {
  name = var.kubernetes_cluster
}

data "aws_eks_cluster_auth" "default" {
  name = var.kubernetes_cluster
}

resource "kubernetes_namespace" "demo" {
  metadata {
    name = var.kubernetes_namespace
  }
}

resource "helm_release" "demo" {
  name = "demo"

  namespace = kubernetes_namespace.demo.metadata[0].name

  chart = "../charts/demo"

  wait   = true
  atomic = true

  values = [jsonencode(var.config)]

  set {
    name = "image.repository"
    value = var.image_repository
    type = "string"
  }

  set {
    name = "image.tag"
    value = var.image_tag
    type = "string"
  }

  set {
    name = "ingress.hosts[0].host"
    value = var.host
    type = "string"
  }
}
