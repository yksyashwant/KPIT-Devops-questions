Challenge - I
We want to automate the deployment of mediawiki on docker/K8/OpenShift, we’d like to see code file.
We want to assess your learnability and your current knowledge of containerizing an application using
an orchestration platform like K8/OpenShift.
Details
    we’ll start with one instance of mediawiki running.
    That’ll be backed by a database server (MySQL/Postgres) running on a separate container.
    We expect this to be installed using these steps: Installing MediaWiki
Expectations:
    • Automated setup for the problem statement including the infrastructure setup using any IAC code
      (Terraform/Azure ARM Template/AWS CloudFormation/GCP) of your choice
    • Adopt best practices in the tools which you are using. For example- Proper syntax and naming,
      Modular code etc.
    • We expect your solution to be designed using orchestration tool of your choice e.g., OpenShift,
      Kubernetes (Use Any Hyperscaler PaaS)
    • Brownie points if the application is running.


Solution:

Here are the steps to deploy MediaWiki on OpenShift with a separate MySQL container:

1. Install OpenShift on your local machine or a cloud platform.

2. Create a new project in OpenShift using the CLI or web console.

3. Deploy a MySQL container in the project using the MySQL image from the OpenShift Container Platform (OCP) registry. You can      use the following command to deploy MySQL:

oc new-app --name mysql \
   --env MYSQL_DATABASE=mediawiki \
   --env MYSQL_USER=mediawiki \
   --env MYSQL_PASSWORD=password \
   --env MYSQL_ROOT_PASSWORD=rootpassword \
   mysql


4. Deploy a MediaWiki container in the same project, linked to the MySQL container. You can use the following command to deploy MediaWiki:

oc new-app --name mediawiki \
   --env MEDIAWIKI_DB_HOST=mysql \
   --env MEDIAWIKI_DB_NAME=mediawiki \
   --env MEDIAWIKI_DB_USER=mediawiki \
   --env MEDIAWIKI_DB_PASSWORD=password \
   mediawiki

5. Create a route for the MediaWiki service to expose it to the internet. You can use the following command to create a route:

	oc expose service mediawiki

