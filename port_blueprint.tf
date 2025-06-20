# resource "port_blueprint" "division" {
#   identifier            = "division"
#   title                 = "División"
#   force_delete_entities = true
#   properties = {
#     string_props = {
#       name = {
#         title    = "Name"
#         required = true
#       }
#       alias = {
#         type  = "string"
#         title = "Alias"
#       }
#       name_leader = {
#         type  = "string"
#         title = "Name Leader"
#       }
#       description = {
#         type  = "string"
#         title = "Description"
#       }
#       creation_date = {
#         title       = "Creation Date"
#         required    = true
#         format      = "date-time"
#         description = "When the Division was created"
#       }
#     }
#     array_props = {
#       status = {
#         required = true
#         string_items = {
#           default = [
#             "Active",
#           ]
#         }
#         title = "Status"
#       }
#     }
#   }
# }

# resource "port_blueprint" "coe_tribe" {
#   identifier            = "coe_tribe"
#   title                 = "COE/Tribe"
#   force_delete_entities = true
#   icon                  = "Tribe"

#   properties = {
#     string_props = {
#       type = {
#         title    = "Type"
#         enum     = ["COE", "Tribe"]
#         required = true
#       }
#       name = {
#         title    = "Name"
#         required = true
#       }
#       alias = {
#         type  = "string"
#         title = "Alias"
#       }
#       description = {
#         type  = "string"
#         title = "Description"
#       }
#       name_leader = {
#         type  = "string"
#         title = "Name Leader"
#       }
#       creation_date = {
#         title       = "Creation Date"
#         required    = true
#         format      = "date-time"
#         description = "When the COE/Tribe was created"
#       }
#     }
#     array_props = {
#       status = {
#         required = true
#         string_items = {
#           default = [
#             "Active",
#           ]
#         }
#         title = "Status"
#       }
#     }
#   }
#   relations = {
#     belongs_to_division = {
#       title    = "Belongs to Division"
#       target   = port_blueprint.division.identifier
#       required = true
#     }
#   }
# }


# resource "port_blueprint" "squad" {
#   identifier            = "squad"
#   title                 = "Squad"
#   force_delete_entities = true
#   icon                  = "Squad"
#   properties = {
#     string_props = {
#       name = {
#         title    = "Name"
#         required = true
#       }
#       alias = {
#         type  = "string"
#         title = "Alias"
#       }
#       description = {
#         type  = "string"
#         title = "Description"
#       }
#       name_leader = {
#         type  = "string"
#         title = "Name Leader"
#       }
#       creation_date = {
#         title       = "Creation Date"
#         required    = true
#         format      = "date-time"
#         description = "When the Squad was created"
#       }
#     }
#     array_props = {
#       status = {
#         required = true
#         string_items = {
#           default = [
#             "Active",
#           ]
#         }
#         title = "Status"
#       }
#     }
#   }
#   relations = {
#     belongs_to_coe_tribe = {
#       title    = "Belongs to COE/Tribe"
#       target   = port_blueprint.coe_tribe.identifier
#       required = true
#     }
#   }
# }


# resource "port_blueprint" "specialty" {
#   identifier            = "specialty"
#   title                 = "Specialty"
#   force_delete_entities = true
#   properties = {
#     string_props = {
#       name = {
#         title    = "Name"
#         required = true
#       }
#       description = {
#         type  = "string"
#         title = "Description"
#       }
#     }
#     array_props = {
#       status = {
#         required = true
#         string_items = {
#           default = [
#             "Active",
#           ]
#         }
#         title = "Status"
#       }
#     }
#   }
# }

# resource "port_blueprint" "role" {
#   identifier            = "role"
#   title                 = "Role"
#   force_delete_entities = true
#   icon                  = "Role"
#   properties = {
#     string_props = {
#       name = {
#         title    = "Name"
#         required = true
#       }
#       description = {
#         title    = "Description"
#         required = false
#       }
#     }
#     array_props = {
#       status = {
#         required = true
#         string_items = {
#           default = [
#             "Active",
#           ]
#         }
#         title = "Status"
#       }
#     }
#   }
# }


# resource "port_blueprint" "engineers" {
#   identifier            = "engineers"
#   title                 = "Engineers"
#   force_delete_entities = true
#   icon                  = "Engineer"
#   properties = {
#     string_props = {
#       email = {
#         title  = "Email"
#         format = "email"
#       }
#       full_name = {
#         title    = "Full Name"
#         required = true
#       }
#       type = {
#         title   = "Type"
#         enum    = ["Organic", "Provider"]
#         default = "Organic"
#       }
#       company = {
#         title   = "Company"
#         default = "Configbug Asociados E.I.R.L."
#       }
#       admission_date = {
#         title       = "Admission Date"
#         required    = true
#         format      = "date-time"
#         description = "When the Engineer was admitted"
#       }
#     }
#     array_props = {
#       status = {
#         required = true
#         string_items = {
#           default = [
#             "Active",
#           ]
#         }
#         title = "Status"
#       }
#     }
#   }
#   relations = {
#     belongs_to_role = {
#       title  = "Belongs to Role"
#       target = port_blueprint.role.identifier
#     }
#     belongs_to_specialty = {
#       title  = "Belongs to Specialty"
#       target = port_blueprint.specialty.identifier
#     }
#     belongs_to_squad = {
#       title  = "Belongs to Squad"
#       target = port_blueprint.squad.identifier
#     }
#   }
# }