kubernetes_cluster = "review"

config = {
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
