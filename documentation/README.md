# TimeOff App: Infrastructure and CI/CD

Dockerized application deployed through AWS ECS, using FARGATE.

## Architecture

The following architecture was proposed for the application:

![Image text](https://github.com/msaavedra91/timeoff-management-application/blob/master/documentation/timeoff-app.drawio-2.png)

For the creation of resources such as: ECR, ECS, Task Definition, ALB, Target Groups, IAM Policies, etc., Terraform was used and the deployment process is through a CI/CD for that infra created in AWS CodePipeline.

## CI/CD

The following flow was proposed for the CI/CD:

![Image text](https://github.com/msaavedra91/timeoff-management-application/blob/master/documentation/ci-cd-timeoff.drawio.png)

### Terraform

As the infrastructure is created in the same repo of the application, a **tf-infra** branch was created which is in charge of storing and deploying all the infrastructure changes made in Terraform.

When a push is made to **tf-infra**, it automatically triggers the CodePipeline that is in charge of deploying the infrastructure to AWS. 

Within the CodePipeline there are 2 CodeBuilds running:

* **tf-plan**: is responsible for executing a `terraform plan`
* **tf-apply**: is responsible for executing a `terraform apply -auto-approve`

### Nodejs app

In this case, any push to the **master** branch will automatically trigger the CodePipeline that is in charge of building the application: docker build, docker tag and docker push to ECR to later update the task definition in the ECS service and deploy the new task(s).