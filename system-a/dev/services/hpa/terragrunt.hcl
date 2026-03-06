
include "root" {
  path = find_in_parent_folders()
}

dependency "eks" {
  config_path = "${path_relative_from_include()}/../eks"
}

inputs = {
  cluster_name = dependency.eks.outputs.cluster_name
}
