Challenge - lll
Use case:
In an OpenShift/K8s cluster, we want to segregate the configuration data from container image contents
to make containerized applications as well as workload portable and reusable to make development,
testing, and production environments with different configuration data as it’s easier to change and
manage, prevents you from hardcoding anything in application configuration data for pod specifications.

Write a YAML script to represent a Pods’ configuration using a key-value pairs of strings. These values
will be used to store configuration for your code, connection strings, username, hostnames, URIs and
URLs.