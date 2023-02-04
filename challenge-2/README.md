Challenge - ll
Background: A k8s/OpenShift cluster is shared among multiple teams to host their containerized
applications and related components wherein each Team deploys their application components in their
respective Namespace. Each Namespace comes with  set quotas for the total amount of memory and
CPU that can be used by all Pods running in a namespace.
Situation:
    Create 3 pods and name them as POD A, POD B and POD C representing 3 different applications.
Write a code in YAML
    1. To deal with the resource crunch issue ensure that POD A consumes 400 MB, POD B 200 MB and
    POC C 400 MB memory, so that all the pods can get the appropriate resources.
    2. MediaWiki Pod wants to access sample data stored in form of a .csv file (You can create a
    sample CSV and put some max 2 rows and 2 column worth data), write a YAML script to make
    this .csv available to the running application pod. (We want to see where you store the .csv file
    to make it accessible to the running application pod)