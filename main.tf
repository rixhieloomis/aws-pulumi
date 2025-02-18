terraform {
  backend "http" {
    address  = "https://api.app.stackguardian.io/api/v1/orgs/wicked-hop/wfgrps/Managed-backend/wfs/Managed-backend/artifacts/tfstate.json"
    username = "richard.loomis@stackguardian.io"
    password = "sgu_26w33hsaXkXgiFXX3Bnss"
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
