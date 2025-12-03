# Shift-Left Container Security on GCP
**Demo repo** for: *Hardening Docker Images During CI/CD (Cloud Build + Trivy) — shift-left security*

Project tested on:
- GCP Project: `devfest-nepal`
- Region: `us-central1`
- Artifact Registry repo: `demo-repo`

---

## What this demo shows (short)
This repo demonstrates an end-to-end CI pipeline that:

1. Builds a Docker image in **Cloud Build**.
2. Scans the built image with **Trivy** during the build (shift-left security).
3. Fails the build if **HIGH** or **CRITICAL** vulnerabilities are detected.
4. Pushes only **clean** images to **Artifact Registry**.

All actions are performed in **Cloud Shell** — no local installs required.

---

## Repo layout
