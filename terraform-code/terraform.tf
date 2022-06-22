terraform {
  backend "artifactory" {
    # URL of the nexus repository
    url      = "http://repo.devops/repository/terraform/" 
    # the repository name you just created
    repo     = "terraform" 
    # an unique path to for identification
    subpath  = "main-site-tfstate" # X5
    # an username that has permissions to the repository
    username = "admin" 
    # the password of the username you provided
    password = "admin123" 
  }
}   