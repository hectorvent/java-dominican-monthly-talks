
data "digitalocean_ssh_key" "iac_for_everyone_ssh_key" {
  name = "iac-for-everyone"
}

resource "digitalocean_vpc" "iac-vpc" {
  name   = "iac-vpc"
  region = "nyc1" 
}

resource "digitalocean_droplet" "iac-everyone-server-1" {
  image      = "debian-12-x64"
  name       = "iac-everyone-server-1"
  region     = "nyc1"
  size       = "s-1vcpu-512mb-10gb"
  vpc_uuid   = digitalocean_vpc.iac-vpc.id
  ssh_keys   = [
    data.digitalocean_ssh_key.iac_for_everyone_ssh_key.id
  ]
}

output "ip_address" {
  value       = digitalocean_droplet.iac-everyone-server-1.ipv4_address
  description = "The public IP address of your Droplet application."
}
