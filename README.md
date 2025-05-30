# Scalable Web App with ALB + ASG

## Architecture
![Architecture Diagram](docs/architecture.png)

## Features
- Auto-scaling EC2 instances
- Application Load Balancer
- Multi-AZ deployment
- CloudWatch monitoring
- Optional RDS database

## Deployment Options

### Terraform
```bash
cd infrastructure/terraform
terraform init
terraform apply
```

### CloudFormation
```bash
aws cloudformation deploy \
  --template-file infrastructure/cloudformation/webapp-stack.yaml \
  --stack-name webapp \
  --capabilities CAPABILITY_IAM
```

### Testing
Get ALB DNS name from AWS Console and test using:

```bash
ab -n 1000 -c 100 http://ALB-DNS/
```
