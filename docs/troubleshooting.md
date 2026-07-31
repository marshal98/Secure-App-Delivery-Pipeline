# Troubleshooting

## GitHub Actions

### permission_denied: write_package

Cause

Missing package permissions.

Solution

Enable Read and Write permissions for GitHub Actions.

---

## SSH Timeout

Cause

Firewall only allowed personal IP addresses.

Solution

Allow GitHub Actions access or use a self-hosted runner.

---

## Terraform

### Missing SSH Key

Cause

Terraform cannot resolve `~/.ssh`.

Solution

Use an absolute path.

---

## Docker

### Container exits immediately

Check logs

```bash
docker logs secure-notes-api
```

---

### Health Check Failure

```bash
curl http://localhost:8000/health
```