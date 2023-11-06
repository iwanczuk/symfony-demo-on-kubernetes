kubernetes_cluster = "production"

config = {
  autoscaling = {
    enabled = true

    minReplicas = 2
    maxReplicas = 10

    targetCPUUtilizationPercentage = 80
  }

  ingress = {
    enabled = true

    hosts = [
      {
        paths = [
          {
            path = "/"

            pathType = "ImplementationSpecific"
          }
        ]
      }
    ]
  }
}
