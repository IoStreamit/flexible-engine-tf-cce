terraform {
  experiments = [module_variable_optional_attrs]
  required_providers {
    flexibleengine = {
      source = "FlexibleEngineCloud/flexibleengine"
      version = "1.17.0"
    }
  }
}