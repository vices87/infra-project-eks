include "root" {
  path = find_in_parent_folders()
}

dependency "eks" {
  config_path = "../../eks"
  skip_outputs = true
}

inputs = {
  cluster_name = local.cluster_name

}
