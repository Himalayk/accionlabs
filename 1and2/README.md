Question 1
<!-- 
This section provides instructions to create a Docker image with Nginx version 1.19. 
Ensure you have Docker installed and configured on your system before running the command.
-->
Run below command to create docker image with nginx1.19
cd path_tofolder/**1and2**
docker build . --file Dockerfile 

Question 2
Run below command to create statefulset of nginx container and this deployment will create Service, Statefulset and Storage class
cd 1and2
kubectl apply -f Deployment.yaml