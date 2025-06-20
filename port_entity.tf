resource "port_entity" "roles" {
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
      "description" = "Líder Tecnico"
      "name"        = "Tech Lead"
    }
  }
  title = "Tech Lead"
}