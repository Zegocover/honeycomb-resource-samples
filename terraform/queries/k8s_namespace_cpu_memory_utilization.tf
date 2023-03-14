data "honeycombio_query_specification" "k8s-namespace-cpu-and-memory" {
  calculation {
    op     = "AVG"
    column = "container.cpu.utilization"
  }

  calculation {
    op     = "AVG"
    column = "container.memory.usage"
  }

  filter {
    column = "k8s.container.name"
    op     = "="
    value  = "pod"
  }

  breakdowns = ["k8s.namespace.name"]

  order {
    column = "container.cpu.utilization"
    op     = "AVG"
    order  = "descending"
  }
}

output "k8s-namespace-cpu-and-memory-query-json" {
  value = data.honeycombio_query_specification.k8s-namespace-cpu-and-memory.json
}
