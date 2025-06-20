# resource "port_action" "demo_import_action" {
#   title       = "Prueba"
#   identifier  = "prueba"
#   publish     = true
#   description = "Probando"
#   github_method = {
#     org                    = "configbug"
#     repo                   = "port-actions"
#     report_workflow_status = "true"
#     workflow               = "action-port.yml"
#     workflow_inputs = jsonencode(
#       {
#         organization = "{{ .organization }}"
#         port_context = {
#           runId = "{{ .run.id }}"
#         }
#         "{{ spreadValue() }}" = "{{ .inputs }}"
#       }
#     )
#   }
#   required_approval = "false"
#   self_service_trigger = {
#     operation = "CREATE"
#     user_properties = {
#       number_props = {
#         "aviso" = {
#           description = "Numero de avisos"
#           title       = "Aviso"
#         },
#       }
#     }
#   }
# }
