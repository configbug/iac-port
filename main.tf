# resource "port_blueprint" "environments" {
#   title       = "Environments"
#   icon        = "CloudFormation"
#   description = "Blueprint que contiene información de los entornos o ambientes de desarrollo"
#   identifier  = "envs"
#   properties = {
#     string_props = {
#       "name" = {
#         title = "Nombre"
#       }
#       "description" = {
#         title      = "Descripción"
#         required   = true
#         max_length = 300
#         icon       = "GitSubIcon"
#       }
#       "size" = {
#         title = "Tamaño"
#         icon  = "DefaultProperty"
#       }
#       "docs-url" = {
#         title  = "Docs URL"
#         format = "url"
#       }
#       "author" = {
#         title       = "Autor"
#         required    = true
#         description = "Autor del ambiente"
#         icon        = "Supervisor"
#         max_length  = 300
#       }
#       "turns" = {
#         default = "Día"
#         enum = [
#           "Día",
#           "Tarde",
#           "Noche",
#         ]
#         enum_colors = {
#           "Día"   = "blue"
#           "Tarde" = "purple"
#           "Noche" = "bronze"
#         }
#         required = false
#         title    = "Turnos"
#       }
#     }
#     array_props = {
#       "casos" = {
#         required     = false
#         title        = "Casos"
#         string_items = {}
#       }
#     }
#     # array_props = {
#     #   "turns" = {
#     #     description = "Turnos de atención"
#     #     required    = false
#     #     title       = "Turnos"
#     #     icon        = "DefaultProperty"
#     #     string_items = {
#     #       enum : ["Día", "Tarde", "Noche", "Madrugada"],
#     #       enumColors : {
#     #         "Día" : "blue",
#     #         "Tarde" : "bronze",
#     #         "Noche" : "lightGray",
#     #         "Madrugada" : "darkGray"
#     #       },
#     #       default = ["Día", "Madrugada"]
#     #     }
#     #   }
#     # }
#   }
#   force_delete_entities = true
# }

# resource "port_blueprint" "virtual_machines" {
#   title      = "Virtual Machines"
#   icon       = "GPU"
#   identifier = "vm"
#   properties = {
#     string_props = {
#       name = {
#         title = "Nombre"
#         icon  = "Dependabot"
#       }
#       description = {
#         title       = "Descripción"
#         icon        = "AzureProvider"
#         description = "Descripción de la maquina virtual"
#         required    = false
#       }
#     }
#     number_props = {
#       cores = {
#         required = false
#         title    = "Cores"
#       }
#     }
#   }
#   relations = {
#     "${port_blueprint.environments.identifier}" = {
#       title    = "Environment"
#       required = true
#       target   = port_blueprint.environments.identifier
#     }
#   }
#   mirror_properties = {
#     "author_environment" = {
#       path  = "${port_blueprint.environments.identifier}.author"
#       title = "Autor Environment"
#     }
#   }
#   force_delete_entities = true
#   depends_on            = [port_blueprint.environments]
# }

# resource "port_blueprint" "GitHub_Repositories" {
#   title                 = "Service"
#   icon                  = "Github"
#   identifier            = "service"
#   force_delete_entities = true
#   properties = {
#     string_props = {
#       "language" = {
#         icon     = "Git"
#         required = false
#         title    = "Language"
#       },
#       "readme" = {
#         format   = "markdown"
#         icon     = "Book"
#         required = false
#         title    = "README"
#       },
#       "slack" = {
#         format   = "url"
#         icon     = "Slack"
#         required = false
#         title    = "Slack"
#       },
#       "tier" = {
#         description = "How mission-critical the service is"
#         enum = [
#           "Mission Critical",
#           "Customer Facing",
#           "Internal Service",
#           "Other",
#         ]
#         enum_colors = {
#           "Customer Facing"  = "green"
#           "Internal Service" = "darkGray"
#           "Mission Critical" = "turquoise"
#           "Other"            = "yellow"
#         }
#         icon     = "DefaultProperty"
#         required = false
#         title    = "Tier"
#       },
#       "url" = {
#         format   = "url"
#         icon     = "Link"
#         required = false
#         title    = "URL"
#       },
#     }
#   }
# }