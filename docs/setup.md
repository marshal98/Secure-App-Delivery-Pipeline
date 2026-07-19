# Environment Setup

## Prerequisites

- Google Cloud Account
- Terraform
- Git
- Docker (later)
- Google Cloud CLI

---

## Clone Repository

```bash
git clone <repository-url>
cd Secure-App-Delivery-Pipeline
```

---

## Authenticate

```bash
gcloud auth login

gcloud auth application-default login
```

---

## Initialize Terraform

```bash
cd infrastructure/terraform

terraform init
terraform plan
terraform apply
```