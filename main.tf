resource "port_entity" "roles2" {
  blueprint  = port_blueprint.role.identifier
  depends_on = [port_blueprint.role]
  properties = {
    array_props = {
      string_items = {
        "status" = [
          "Active",
        ]
      }
    }
    string_props = {
      "description" = "Líder Técnico"
      "name"        = "Tech Lead"
    }
  }
  title = "Tech Lead 2"
}
