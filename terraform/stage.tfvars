kubernetes_cluster = "stage"

config = {
  autoscaling = {
    enabled = true

    minReplicas = 1
    maxReplicas = 2

    targetCPUUtilizationPercentage = 50
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
