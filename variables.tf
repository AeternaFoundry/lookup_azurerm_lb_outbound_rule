variable "lb_outbound_rule_lookup" {
  description = <<EOT
Map of lb_outbound_rule_lookup, attributes below
Required:
    - loadbalancer_id
    - name
EOT

  type = map(object({
    loadbalancer_id = string
    name            = string
  }))
  validation {
    condition = alltrue([
      for k, v in var.lb_outbound_rule_lookup : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

