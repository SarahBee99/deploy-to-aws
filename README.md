# Deploy to AWS

A Terraform configuration that creates an S3 bucket configured for static website hosting.

## Getting Started

### 1. Fork the repository

Click the **Fork** button at the top-right of this repository to create a copy under your own GitHub account.

### 2. Clone your fork

```bash
git clone https://github.com/<your-username>/deploy-to-aws.git
cd deploy-to-aws
```

### 3. Configure AWS credentials

Ensure you have AWS credentials configured. You can use an AWS profile:

```bash
export AWS_PROFILE=your-profile-name
```

### 4. Run Terraform

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

## Exercise: Create a GitHub Actions workflow

Your task is to create a CI/CD pipeline using GitHub Actions.

### Steps

1. In your forked repository, create the directory `.github/workflows/`
2. Inside it, create a file named `deploy.yaml`
3. Add the workflow configuration

The workflow should:
- Trigger on `push` and `pull_request` to the `main` branch
- Run on `ubuntu-latest`
- Configure AWS credentials using access keys stored in GitHub Secrets
- Run `terraform fmt -check`, `terraform init`, `terraform validate`, `terraform plan`, and `terraform apply`

### Template

Copy the following template into `.github/workflows/deploy.yaml` and fill in the required values:

```yaml
name: Deploy

on:
  push:
    branches: [main]

jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ap-southeast-1

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3

      - name: Terraform fmt
        run: <add the correct command here>

      - name: Terraform Init
        run: <add the correct command here>

      - name: Terraform Validate
        run: <add the correct command here>

      - name: Terraform Plan
        run: <add the correct command here>

      - name: Terraform Apply
        if: github.ref == 'refs/heads/main' && github.event_name == 'push'
        run: <add the correct command here>
```

### Required Secrets

Add the following secrets in your repository at **Settings → Secrets and variables → Actions**:

| Secret Name | Description |
|-------------|-------------|
| `AWS_ACCESS_KEY_ID` | Your AWS access key ID |
| `AWS_SECRET_ACCESS_KEY` | Your AWS secret access key |

### Verify

Once the workflow is configured and pushed, GitHub Actions will automatically run the pipeline on every push to `main`.
