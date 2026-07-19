# Secure App Delivery Pipeline

An end-to-end DevSecOps project demonstrating how to securely build, containerize, provision infrastructure, and deploy an application using modern cloud-native practices.

## Project Goals

- Provision infrastructure using Terraform
- Deploy a containerized application on Google Cloud
- Automate deployments using GitHub Actions
- Integrate DevSecOps security scanning into the CI/CD pipeline
- Follow Infrastructure as Code and GitOps best practices

---

## Technology Stack

### Cloud

- Google Cloud Platform (GCP)
- Compute Engine
- VPC Networking

### Infrastructure

- Terraform

### Containerization

- Docker

### CI/CD

- GitHub Actions

### Security

- Trivy
- Gitleaks
- Checkov
- SBOM Generation
- Dependabot

### Application

- FastAPI (Coming Soon)

---

## Current Progress

- [x] Google Cloud Project
- [x] Terraform Setup
- [x] Custom VPC
- [x] Custom Subnet
- [x] Firewall Rules
- [x] Ubuntu Virtual Machine
- [ ] Docker
- [ ] Sample Application
- [ ] GitHub Actions
- [ ] Security Scanning
- [ ] Automated Deployment

---

## Repository Structure

```text
.
├── app/
├── docker/
├── docs/
├── infrastructure/
├── scripts/
└── .github/
```

---

## Architecture

See:

```text
docs/architecture.md
```

---

## Learning Outcomes

This repository demonstrates:

- Infrastructure as Code
- Cloud Networking
- Virtual Machine Provisioning
- Docker
- CI/CD
- DevSecOps
- Secure Deployment