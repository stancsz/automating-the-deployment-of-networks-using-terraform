# Automating the Deployment of Networks Using Terraform

Lab Exercise

## Task 1. Set up Terraform and Cloud Shell

### [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli#:~:text=To%20install%20Terraform%2C%20find%20the,and%20Terraform%20will%20still%20function.)

```
$ terraform --version
Terraform v0.12.24
```

### Create a directory for Terraform configuration

```
$ mkdir tfnet
```

### Initialize Terraform

created `tfnet/provider.tf`

```
$ terraform init
Initializing the backend...
Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "google" (hashicorp/google) 3.39.0...
The following providers do not have any version constraints in configuration,
so the latest version was installed.
To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.
* provider.google: version = "~> 3.39"
```

## Task 2. Create managementnet and its resources

### add google compute network

created `tfnet/managementnet.tf`

with contents of 

```
# Create the managementnet network
resource [RESOURCE_TYPE] "managementnet" {
name = [RESOURCE_NAME]
#RESOURCE properties go here
}
```

where 

```
[RESOURCE_TYPE] = "google_compute_network"
[RESOURCE_NAME] = "managementnet"
```

should also set

```
auto_create_subnetworks = "false"
```

### add subnet to management

```
# Create managementsubnet-us subnetwork
resource "google_compute_subnetwork" "managementsubnet-us" {
name          = "managementsubnet-us"
region        = "us-central1"
network       = google_compute_network.managementnet.self_link
ip_cidr_range = "10.130.0.0/20"
}
```

### Add firewall rules

```
# Add a firewall rule to allow HTTP, SSH, and RDP traffic on managementnet
resource [RESOURCE_TYPE] "managementnet-allow-http-ssh-rdp-icmp" {
name = [RESOURCE_NAME]
#RESOURCE properties go here
}
```

where

```
[RESOURCE_TYPE] = "google_compute_firewall"
[RESOURCE_NAME] = "managementnet-allow-http-ssh-rdp-icmp"
```

also set

```
network = google_compute_network.managementnet.self_link
```

add protocols

```
allow {
    protocol = "tcp"
    ports    = ["22", "80", "3389"]
    }
allow {
    protocol = "icmp"
    }
```

