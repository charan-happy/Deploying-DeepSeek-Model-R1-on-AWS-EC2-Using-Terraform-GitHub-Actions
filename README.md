# Deploying-DeepSeek-Model-R1-on-AWS-EC2-Using-Terraform-GitHub-Actions

- Deploy DeepSeek Model R1, a powerful AI/ML model designed for scalable solutions, to an AWS EC2 instance using Terraform for infrastructure provisioning and GitHub Actions for automation. Along with automating the deployment pipeline, you will also focus on ensuring data security and model privacy as part of the deployment process. The goal is to streamline the deployment, making it efficient, reproducible, and scalable, while also addressing key security considerations when dealing with sensitive AI/ML models and data.

### What is deepseek model R1 ?
- The DeepSeek Model R1 is a state-of-the-art machine learning model designed for advanced data analysis, predictive modeling, and real-time inference. It can be used across industries for applications such as fraud detection, predictive maintenance, healthcare diagnostics, and NLP

### why scalable AI solutions on EC2 ?
- AWS EC2 provides a flexible and scalable environment for hosting AI models, making it an ideal choice for DeepSeek Model R1. EC2 offers customizable compute capacity and the ability to scale resources depending on the model's performance needs. This ensures that as the data or workload increases, your AI solution remains efficient and responsive. It also integrates easily with other AWS services such as S3 for data storage, CloudWatch for monitoring, and IAM for secure access management.

### How Terraform and Github Actions Work Together
- Terraform: Automates the provisioning of the AWS EC2 instance, security groups, IAM roles, Load Balancer, and other necessary resources for the DeepSeek Model.
GitHub Actions: Automates the deployment of the DeepSeek Model to the EC2 instance, pulling the latest model updates, setting environment variables, and managing application configuration

### Security Considerations 
- IAM Roles & Policies: Proper IAM roles are set up to ensure only authorized entities can interact with the model. These roles grant least privilege access to EC2, S3, and other resources.
Data Encryption: Sensitive data is encrypted both in transit and at rest, ensuring data security throughout the process

********************************************************************************************************************************
# DeepSeek Model R1 Deployment on AWS

This project automates the deployment of the DeepSeek Model R1, a powerful AI/ML model, to an AWS EC2 instance using Terraform for infrastructure provisioning and GitHub Actions for CI/CD automation. The deployment ensures scalability, reproducibility, and security, with a focus on data encryption and least privilege access

Table of Contents 
-----------------

1. [Project Overview]()  
2. [Architecture]()  
3. [Pre-requisites]()  
4. [SetUp Instructions]()  
5. [Security Considerations]()  
6. [Usage]()  
7. [CleanUp]()  
8. [Troubleshooting]()

### 1. Project Overview
- The goal of this project is to deploy the DeepSeek Model R1 to an AWS EC2 instance in a secure, scalable, and automated manner. The deployment includes:

    **Terraform:** For provisioning AWS resources (EC2, S3, Load Balancer, Security Groups, IAM roles).

   **GitHub Actions:** For automating the deployment pipeline.

   **Docker:** For containerizing and running the DeepSeek Model R1.

  **Security:** Encryption of data at rest and in transit, and least privilege IAM roles.

### 2. Architecture  
- The architecture consists of the following components:

1. EC2 Instance: Hosts the DeepSeek Model R1 in a Docker container.

2. S3 Bucket: Stores sensitive data with server-side encryption.

3. Application Load Balancer (ALB): Distributes traffic to the EC2 instance and provides HTTPS access.

4. IAM Roles: Ensures least privilege access for the EC2 instance.

5. GitHub Actions: Automates the deployment and cleanup process.

### 3. Pre-requisites  
- Before starting, ensure you have the following:

1. AWS Account: With permissions to create EC2 instances, S3 buckets, IAM roles, and Load Balancers.

2. Terraform: Installed on your local machine or CI/CD environment.

3. GitHub Repository: For hosting the project code and GitHub Actions workflow.

4. AWS CLI: Configured with your credentials.

5. Docker: For containerizing the DeepSeek Model R1

### 4. SetUp Instructions  

step 1: clone the Repository

clone the respository to your local environment.

```
git clone https://github.com/your-username/deepseek-model-r1.git
cd deepseek-model-r1
```

Step 2 : configure the Github Secrets

Add the following secrets to your github Repository. 

`AWS_ACCESS_KEY`: your AWS ACcess Key  
`AWS_SECRET_ACCESS_KEY`: your AWS Secret Key  
`AWS_REGION`: The AWS Region  
`SSH_PRIVATE_KEY`: The Private key for ssh access to the EC2 instance

- To add secrets in github , 1. Go to project repository -> Navigate to settings > Secrets and Variables > Actions and then click on new repository secret and add the secret.

Step 3: Update Terraform Variables

- Update `variables.tf` file with your AWS region, AMI ID, instance type and other configurations

step 4: Run Github Actions Workflow 

- Push the code to the `main` branch to trigger the github actions workflow. The workflow will :

1. Provision AWS Resources using Terraform

2. Deploy the Deepseek model R1 to the Ec2 Instance

3. Setup loadbalancer for external access


### 5. Security Considerations

- The project includes the following security measures :

1. IAM Role and Policies :
    - Least privilege access for EC2 instances
    - Restrictive permission for S3 access
2. Data Encryption 
    - S3 buckets are encrypted at rest using AES-256
    - Load Balancer Configured with HTTPS for encryption in transit
3. Security Groups
    - Restrict Inbound traffic to necessary Ports (SSH, HTTP, HTTPS)
    - Block all unnecessary outbound traffic

### 6. Usage
- Once the deployment is complete:
1. Access the Deepseek Model R1 webUI using loadbalancer DNS name : `http://<ALB-DNS-name>`
2. Use the Ec2 instance for model inference for further development

### 7. CleanUp
- To avoid unnecessary Costs, Cleanup the resources after use

1. Manual `Cleanup`: Run the `terraform destroy` command : `terraform destroy --auto-approve`
2. Automated Cleanup : Trigger the `cleanup` job in the github actions workflow.

### 8. Troubleshooting


[Refer](charan-happy/Deploying-DeepSeekModel-R1-on-AWS-Cloud-Using-Terraform-and-Github-Action)

### 9. References 

[1. Terraform Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

[2. Github Actions Documentation](https://docs.github.com/en/actions)

[3. Docker Documentation](https://docs.docker.com/)

[4. AWS EC2 User Guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)



