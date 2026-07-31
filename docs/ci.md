# Continuous Integration

The CI pipeline is triggered on every push to the main branch.

## Workflow

```text
Checkout Repository

↓

Install Dependencies

↓

Verify Application

↓

Build Docker Image

↓

Push to GHCR
```

## Docker Tags

Every build publishes

- latest
- commit SHA

Example

```
latest

1a02acc...
```