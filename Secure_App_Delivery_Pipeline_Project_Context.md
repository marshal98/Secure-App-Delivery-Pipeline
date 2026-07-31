# Secure App Delivery Pipeline -- Project Context & Current Status

## Project Goal

I am building a **Secure App Delivery Pipeline** as a portfolio project
to demonstrate modern DevSecOps and Application Security practices.

The objective is to build an end-to-end pipeline that provisions
infrastructure, builds and deploys a containerized application, and
later integrates security scanning tools such as Trivy, Gitleaks,
Checkov, and SBOM generation.

This is intended to be a production-style learning project and portfolio
piece.

------------------------------------------------------------------------

# Current Architecture

``` text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Actions (CI)
    │
    ▼
Build Docker Image
    │
    ▼
GitHub Container Registry (GHCR)
    │
    ▼
GitHub Actions (CD)
    │
    ▼
SSH into Google Cloud VM
    │
    ▼
Docker Pull
    │
    ▼
Stop Existing Container
    │
    ▼
Run New Container
    │
    ▼
Health Check
    │
    ▼
Nginx Reverse Proxy
    │
    ▼
FastAPI Application
```

## Technology Stack

### Cloud

-   Google Cloud Platform (GCP)
-   Compute Engine VM
-   Custom VPC
-   Custom Subnet
-   Firewall Rules

### Infrastructure as Code

-   Terraform

### Application

-   Python
-   FastAPI
-   Uvicorn

### Containerization

-   Docker

### CI/CD

-   GitHub Actions

### Container Registry

-   GitHub Container Registry (GHCR)

### Reverse Proxy

-   Nginx

------------------------------------------------------------------------

# Repository Structure

``` text
Secure-App-Delivery-Pipeline/
├── .github/
│   └── workflows/
│       ├── ci.yml
│       └── cd.yml
├── app/
├── infrastructure/
│   └── terraform/
├── docs/
│   ├── architecture.md
│   ├── infrastructure.md
│   ├── application.md
│   ├── ci.md
│   ├── cd.md
│   ├── troubleshooting.md
│   └── roadmap.md
├── README.md
├── LICENSE
└── .gitignore
```

------------------------------------------------------------------------

# Infrastructure

Terraform provisions:

-   VPC
-   Subnet
-   Firewall Rules
-   Compute Engine VM

Current Region: **asia-south1**

Current Zone: **asia-south1-a**

VM OS: **Ubuntu 24.04 LTS**

Docker is installed manually on the VM.

------------------------------------------------------------------------

# Firewall

Originally SSH access was restricted to personal IPs.

GitHub Actions failed with:

``` text
dial tcp <VM-IP>:22: i/o timeout
```

Root cause: GitHub-hosted runners use dynamic IP addresses.

Temporary fix:

``` text
0.0.0.0/0
```

Future improvement:

-   Self-hosted GitHub Runner
-   Google Cloud IAP
-   Bastion Host

------------------------------------------------------------------------

# FastAPI Application

Application: **Secure Notes API**

Endpoints:

-   GET /
-   GET /health
-   GET /docs

Run locally:

``` bash
uvicorn app.main:app --reload
```

------------------------------------------------------------------------

# Docker

-   Dockerized FastAPI application
-   Images pushed to GitHub Container Registry (GHCR)
-   Image tags:
    -   latest
    -   Git commit SHA

------------------------------------------------------------------------

# GitHub Actions

## Continuous Integration

Pipeline:

``` text
Checkout Repository
        ↓
Install Dependencies
        ↓
Verify Application
        ↓
Docker Build
        ↓
Docker Login GHCR
        ↓
Docker Push
```

Runs automatically on code changes.

## Continuous Deployment

Pipeline:

``` text
Manual Trigger
        ↓
SSH to VM
        ↓
Docker Login
        ↓
Docker Pull
        ↓
Stop Existing Container
        ↓
Remove Container
        ↓
Run New Container
        ↓
Health Check
        ↓
Deployment Complete
```

Uses `workflow_dispatch`.

------------------------------------------------------------------------

# GitHub Secrets

Repository Secrets configured:

-   VM_HOST
-   VM_USER
-   VM_SSH_KEY

Environment Secrets are not currently used.

------------------------------------------------------------------------

# Nginx

Acts as a reverse proxy.

``` text
Internet
    ↓
Port 80
    ↓
Nginx
    ↓
Docker Container
    ↓
FastAPI
```

------------------------------------------------------------------------

# Current Status

## Completed

-   ✅ Terraform Infrastructure
-   ✅ VPC & Subnet
-   ✅ Firewall Rules
-   ✅ Google Cloud VM
-   ✅ FastAPI Application
-   ✅ Docker
-   ✅ GitHub Container Registry
-   ✅ GitHub Actions CI
-   ✅ GitHub Actions CD
-   ✅ SSH Deployment
-   ✅ Health Checks
-   ✅ Nginx Reverse Proxy

The complete CI/CD pipeline is working successfully.

------------------------------------------------------------------------

# Documentation

Current documentation includes:

-   README.md
-   LICENSE
-   docs/architecture.md
-   docs/application.md
-   docs/infrastructure.md
-   docs/ci.md
-   docs/cd.md
-   docs/troubleshooting.md
-   docs/roadmap.md

Deferred until v1.0:

-   CONTRIBUTING.md
-   SECURITY.md
-   CHANGELOG.md
-   CODE_OF_CONDUCT.md
-   GitHub Issue Templates
-   Pull Request Templates
-   Screenshots
-   GitHub Releases
-   Repository Badges

------------------------------------------------------------------------

# Next Phase -- Security

Implement in this order:

1.  Trivy
    -   Filesystem Scan
    -   Docker Image Scan
    -   Fail build on HIGH/CRITICAL vulnerabilities
2.  Gitleaks
    -   Secret Detection
3.  Checkov
    -   Terraform Security Scan
4.  SBOM
    -   CycloneDX preferred
5.  Dependency Scanning

------------------------------------------------------------------------

# Future Enhancements

-   Docker Compose
-   Automatic Rollback
-   HTTPS (Let's Encrypt)
-   Blue/Green Deployment
-   Self-hosted GitHub Runner
-   GitHub Releases
-   Portfolio-quality README
-   Architecture Diagrams

------------------------------------------------------------------------

# Project Philosophy

This project demonstrates:

-   Infrastructure as Code
-   Secure Software Delivery
-   CI/CD Automation
-   Cloud Deployment
-   Application Security
-   DevSecOps Best Practices

The goal is to showcase a production-inspired Secure App Delivery
Pipeline suitable for interviews, GitHub portfolios, and technical
discussions.

------------------------------------------------------------------------

# Current Milestone

The project is stable with a fully functional CI/CD pipeline.

The next phase focuses on integrating security tooling:

-   Trivy
-   Gitleaks
-   Checkov
-   SBOM
-   Dependency Scanning

After that, the repository will be polished for a **v1.0** release.
