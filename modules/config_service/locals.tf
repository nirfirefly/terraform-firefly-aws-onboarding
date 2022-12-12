locals {
  global_services_region = length(var.config_service_regions) > 0 ?  var.config_service_regions[0] : ""
}