terraform {
  backend "http" {
    address  = "https://testapi.qa.stackguardian.io/api/v1/orgs/demo-org/wfgrps/Managed-backend/wfs/CUSTOM-1Vtc/artifacts/tfstate.json/"
  }
}

resource "null_resource" "workflow_example" {
  provisioner "local-exec" {
    command = "echo 'OpenTofu workflow example'"
  }
}

output "workflow_example_output" {
  value = resource.null_resource.workflow_example.id
}
