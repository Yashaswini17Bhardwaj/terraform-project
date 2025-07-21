resource "kubernetes_ingress_v1" "demo_app" {
  metadata {
    name      = "demo-ingress"
    namespace = "staging"  
    annotations = {
      "kubernetes.io/ingress.class"            = "alb"  # Tells LB Controller to manage
      "alb.ingress.kubernetes.io/scheme"       = "internet-facing"  # Public ALB
      "alb.ingress.kubernetes.io/target-type"  = "ip"  # Targets pod IPs
      "alb.ingress.kubernetes.io/healthcheck-path" = "/"  # For auto health checks
    }
  }
  spec {
    rule {
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "demo-app-service"  # Matches service.yaml
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
