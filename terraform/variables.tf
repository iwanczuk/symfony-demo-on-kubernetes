variable "region" {
  type        = string
  description = "Region"
  default     = "us-east-2"
}

variable "kubernetes_cluster" {
  type        = string
  description = "Kubernetes cluster"
}

variable "kubernetes_namespace" {
  type        = string
  description = "Kubernetes namespace"
}

variable "image_repository" {
  type        = string
  description = "Image repository"
  default     = "demo"
}

variable "image_tag" {
  type        = string
  description = "Image tag"
  default     = "latest"
}

variable "config" {
  type        = any
  description = "Config"
  default     = {}
}

variable "host" {
  type        = string
  description = "Host"
}
