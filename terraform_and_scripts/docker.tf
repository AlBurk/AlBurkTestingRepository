terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}


resource "docker_image" "password_image" {
  name = "docker_random"
  build {
    path = "../"
    tag  = ["password:app"]
  }
}

resource "docker_service" "pass_app" {
  name = "pass_app"
  task_spec {
   container_spec {
     image = docker_image.password_image.latest
    }
  }
}

