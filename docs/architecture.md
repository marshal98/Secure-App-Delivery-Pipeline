# Architecture

## Current Architecture

```text
                    Google Cloud Platform

                    +----------------------+
                    |   Custom VPC         |
                    +----------+-----------+
                               |
                     +---------+---------+
                     | Custom Subnet     |
                     +---------+---------+
                               |
                     +---------+---------+
                     | Ubuntu VM         |
                     | e2-small          |
                     +---------+---------+
                               |
                +--------------+--------------+
                | Firewall Rules              |
                | SSH (Restricted)            |
                | HTTP                        |
                | HTTPS                       |
                +-----------------------------+
```

---

## Resources Created

| Resource | Status |
|----------|--------|
| VPC      | ✅ |
| Subnet   | ✅ |
| Firewall | ✅ |
| Ubuntu VM| ✅ |

---

## Future Architecture

```text
Developer
      │
      ▼
GitHub
      │
      ▼
GitHub Actions
      │
      ▼
Docker Build
      │
      ▼
Container Registry
      │
      ▼
Ubuntu VM
      │
      ▼
Docker Container
      │
      ▼
FastAPI Application
```