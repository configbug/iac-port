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

# resource "port_blueprint" "port_workload" {
#   identifier  = "workload"
#   title       = "Workload"
#   description = "This blueprint represents a k8s Workload. This includes all k8s objects which can create pods (deployments[replicasets], daemonsets, statefulsets...)"
#   icon        = "Deployment"
#   mirror_properties = {
#     "Cluster" = {
#       path  = "Namespace.Cluster.$title"
#       title = "Cluster"
#     },
#     "namespace" = {
#       path  = "Namespace.$title"
#       title = "Namespace"
#     },
#   }
#   properties = {
#     array_props = {
#       "containers" = {
#         description = "The containers for each pod instance of the Workload"
#         required    = false
#         title       = "Containers"
#       },
#       "images" = {
#         required = false
#         title    = "Images"
#       },
#     }
#     boolean_props = {
#       "hasLatest" = {
#         description = "Has Container with 'latest' as image tag"
#         required    = false
#         title       = "Has 'latest' tag"
#       },
#       "hasLimits" = {
#         required = false
#         title    = "All containers have limits"
#       },
#       "hasPrivileged" = {
#         required = false
#         title    = "Has Privileged Container"
#       },
#     }
#     number_props = {
#       "availableReplicas" = {
#         description = "Current running replica count"
#         required    = false
#         title       = "Running Replicas"
#       },
#       "replicas" = {
#         description = "Wanted replica count"
#         required    = false
#         title       = "Wanted Replicas"
#       },
#     }
#     object_props = {
#       "labels" = {
#         description = "Labels of the Workload"
#         required    = false
#         title       = "Labels"
#       },
#       "strategyConfig" = {
#         description = "The workloads rollout strategy"
#         required    = false
#         title       = "Strategy Config"
#       },
#     }
#     string_props = {
#       "creationTimestamp" = {
#         description = "When the Workload was created"
#         format      = "date-time"
#         required    = false
#         title       = "Created"
#       },
#       "isHealthy" = {
#         enum = [
#           "Healthy",
#           "Unhealthy",
#         ]
#         enum_colors = {
#           "Healthy"   = "green"
#           "Unhealthy" = "red"
#         }
#         required = false
#         title    = "Workload Health"
#       },
#       "kind" = {
#         description = "The kind of Workload"
#         enum = [
#           "StatefulSet",
#           "DaemonSet",
#           "Deployment",
#           "Rollout",
#         ]
#         required = false
#         title    = "Workload Kind"
#       },
#       "strategy" = {
#         description = "Rollout Strategy"
#         required    = false
#         title       = "Strategy"
#       },
#     }
#   }
#   relations = {
#     "Namespace" = {
#       many     = false
#       required = false
#       target   = "namespace"
#       title    = "Namespace"
#     },
#   }
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

