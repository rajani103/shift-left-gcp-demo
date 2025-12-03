# Shift-Left Container Security on GCP: Hardening Docker Images During CI/CD

This repository demonstrates how to apply **Shift-Left Container Security** on **Google Cloud Platform (GCP)** by hardening Docker images and integrating vulnerability scanning directly into the **CI/CD pipeline** using **Cloud Build** and **Trivy**.

The core idea of this demo:  
👉 **Catch vulnerabilities early (during image build), not after deployment.**  
👉 **Block insecure images automatically.**  
👉 **Push only clean, hardened images to Artifact Registry.**

Everything is executed using **Cloud Shell → Cloud Build**, with no local Docker or Trivy installations required.

---

## ⭐ What This Demo Covers

### ✔ Hardened Docker Image  
A secure Dockerfile based on:
- Minimal **Alpine** base  
- **Non-root** user  
- Least-privilege permissions  
- Clean, small runtime surface  

### ✔ CI/CD Security in Cloud Build  
A `cloudbuild.yaml` pipeline that:
1. **Builds** the Docker image  
2. **Scans** the image using Trivy  
3. **Fails** the build when HIGH/CRITICAL vulnerabilities are detected  
4. **Pushes** clean images only  

### ✔ Mirrored Trivy Scanner  
To avoid Docker Hub rate limits or connectivity issues, Trivy is **mirrored into Artifact Registry** and used from there.

### ✔ Shift-Left Security Principle  
Security is applied **during CI**, not after deployment.  
Developers receive immediate vulnerability feedback.

---

## ⭐ Architecture Overview

