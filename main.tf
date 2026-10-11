data "azurerm_lb_outbound_rule" "lb_outbound_rule_lookup" {
  for_each = var.lb_outbound_rule_lookup

  loadbalancer_id = each.value.loadbalancer_id
  name            = each.value.name
}

