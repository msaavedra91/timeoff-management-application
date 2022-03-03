# TimeOff App: Infrastructure and CI/CD

Dockerized application deployed through AWS ECS, using FARGATE.

## Architecture

The following architecture was proposed for the application:

![Image text](https://github.com/msaavedra91/timeoff-management-application/blob/master/documentation/timeoff-app.drawio-2.png)

For the creation of resources such as: ECR, ECS, Task Definition, ALB, Target Groups, IAM Policies, etc., Terraform was used and the deployment process is through a CI/CD for that infra created in AWS CodePipeline.

## CI/CD

The following flow was proposed for the CI/CD:

![Image text](https://github.com/msaavedra91/timeoff-management-application/blob/master/documentation/timeoff-app.drawio-2.png)