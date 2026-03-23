resource "null_resource" "deploy" {
  provisioner "local-exec" {
    command = "ansible-playbook ../ansible/deploy.yml"
  }
}