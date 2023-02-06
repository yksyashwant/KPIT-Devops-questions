provider "openshift" {
  version = "3.11.0"
}

resource "openshift_project" "my_project" {
  display_name = "Project for mediawiki"
  description = "A project for deploying MediaWiki and MySQL on OpenShift"
}

resource "openshift_mysql_database_service" "mysql" {
  name            = "mysql"
  project         = openshift_project.my_project.name
  database_name   = "mediawiki"
  username        = "mediawiki"
  password        = "password"
  root_password   = "rootpassword"
}

resource "openshift_mediawiki_app" "mediawiki" {
  name            = "mediawiki"
  project         = openshift_project.my_project.name
  database_host   = openshift_mysql_database_service.mysql.name
  database_name   = "mediawiki"
  database_user   = "mediawiki"
  database_pass   = "password"
}

resource "openshift_route" "mediawiki" {
  name            = "mediawiki"
  project         = openshift_project.my_project.name
  service         = openshift_mediawiki_app.mediawiki.name
  path            = "/"
  host            = "www.my_project.com"
  tls {
    termination = "edge"
  }
}
