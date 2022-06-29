locals {
  date_and_time = formatdate("DD-MMM-YYYY-hh-mm-ss", timestamp())
}
terraform {
  backend "artifactory" {
    # URL of the nexus repository
    url      = "http://nexus:8081/repository"  #  ipconfig getifaddr en0
    # the repository name you just created
    repo     = "terraform" 
    # an unique path to for identification
    subpath  = "tfstate" # X5
    # an username that has permissions to the repository
    username = "admin" 
    # the password of the username you provided
    password = "Q1w2e3r4t5y6" 
  }
}   