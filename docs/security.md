# Security Policy

## Supported Versions

| Version | Supported |
|----------|-----------|
| v1.x | ✅ |
| < v1.0 | ❌ |

---

## Reporting a Vulnerability

If you discover a security vulnerability, please open a private security report through GitHub Security Advisories or contact the repository owner directly.

Please include:

- Description
- Steps to reproduce
- Impact
- Suggested remediation

---

## Security Controls

This repository implements the following security controls:

- Secret Scanning (Gitleaks)
- Dependency Scanning (Trivy)
- Infrastructure Security (Checkov)
- Static Code Analysis (Semgrep)
- Container Image Scanning (Trivy)
- SBOM Generation (Syft)
- Automated Dependency Updates (Dependabot)

All pull requests must pass the required security checks before merging.