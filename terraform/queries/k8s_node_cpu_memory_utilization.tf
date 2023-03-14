data "honeycombio_query_specification" "k8s-node-cpu-and-memory" {
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
    value  = "node"
  }

  breakdowns = ["k8s.node.name"]

  order {
    column = "container.cpu.utilization"
    op     = "AVG"
    order  = "descending"
  }
}

output "k8s-node-cpu-and-memory-query-json" {
  value = data.honeycombio_query_specification.k8s-node-cpu-and-memory.json
}
