**Question 1**
<!-- 
This section provides instructions to create a Docker image with Nginx version 1.19. 
Ensure you have Docker installed and configured on your system before running the command.
-->
Run below command to create docker image with nginx1.19

cd path_to_folder/**1and2**
docker build . --file Dockerfile 

**Question 2**
Run below command to create a statefulset of nginx container, and this deployment will create Service, Statefulset and Storage class

cd 1and2
kubectl apply -f Deployment.yaml

**Question 3**
Any commit to main branch will strat building new docker image using dockerfile of question1 and push to dockerhub public repo with trivy scan in the pipeline
Pipeline file location: .github/workflow/docker-image.yml

**Question 4** 
<!-- sample_data.csv is the dummy data to provide input to the script -->
Run below command to filter security scan(dummy) data to provide Application Names which has vulnerabilities with CSV id

cd 4and5
sh filter_data.sh sample_data.csv

**Question 5**
<!-- sample_data.csv is the dummy data to provide input to the script 
Ensure Python is installed to run 
-->
Run below command to filter security scan(dummy) data to provide Application Names which has vulnerabilties with CSV id with python 

python filter_data.py sample_data.csv

**Question 6**
Run below commands to get sum ot even Fibonacci numbers

cd 6 
sh sum-even-fibbo.sh

**Question 7**
Run below commands to find common numbers from 2 different arrays
cd 7 
bash common_filter.sh

**Question 8**
Run the below commands for Decimal digit calculation 
cd 8
python digit_calculation.py
