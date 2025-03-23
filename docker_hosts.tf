resource "hcloud_server" "docker" {
  count       = var.instances
  name        = "docker-${count.index}"
  image       = var.os_type
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  firewall_ids = [hcloud_firewall.myfirewall.id]
  labels = {
    type = "docker"
  }
  user_data = file("user_data.yml")
}
