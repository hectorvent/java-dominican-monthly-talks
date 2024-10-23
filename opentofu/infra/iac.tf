# resource "digitalocean_ssh_key" "ansible-lab-sshkey" {
#   name = "ansible-lab-sshkey"
#   public_key = file("../sshkeys/sshkey.pub")
# }

data "digitalocean_ssh_key" "iac_for_everyone_ssh_key" {
  name = "iac-for-everyone"
}

resource "digitalocean_droplet" "web_server" {
  count      = 3
  image      = "debian-12-x64"
  name       = "webserver-${count.index}"
  region     = "nyc1"
  size       = "s-1vcpu-512mb-10gb"
  monitoring = true
  ssh_keys = [
    data.digitalocean_ssh_key.iac_for_everyone_ssh_key.id
  ]
}

resource "digitalocean_droplet" "load_balancer_server" {
  image      = "debian-12-x64"
  name       = "load-balancer-server"
  region     = "nyc1"
  size       = "s-1vcpu-512mb-10gb"
  monitoring = true
  ssh_keys = [
    data.digitalocean_ssh_key.iac_for_everyone_ssh_key.id
  ]
}

output "web_server_ip_address" {
  value       = digitalocean_droplet.web_server.*.ipv4_address
  description = "The public IP address of webserver*"
}

output "load_balancer_server_ip_address" {
  value       = digitalocean_droplet.load_balancer_server.ipv4_address
  description = "The public IP address of proxy."
}