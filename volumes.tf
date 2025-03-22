resource "hcloud_volume" "docker_server_volume" {
  count    = var.instances
  name     = "docker-server-volume-${count.index}"
  size     = var.disk_size
  location = var.location
  format   = "xfs"
}

resource "hcloud_volume_attachment" "docker_vol_attachment" {
  count     = var.instances
  volume_id = hcloud_volume.docker_server_volume[count.index].id
  server_id = hcloud_server.docker[count.index].id
  automount = true
}
