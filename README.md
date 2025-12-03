Shift-Left Container Security on GCP – Demo Explanation

This project demonstrates how to implement Shift-Left Container Security using Google Cloud Build, Artifact Registry, and Trivy.
The goal is simple: build a container image, scan it for vulnerabilities during CI, block bad images, and push only clean images to Artifact Registry.

This demo is fully cloud-native — everything runs in Cloud Shell and Cloud Build, so you don’t need Docker or Trivy installed locally.

⭐ What This Demo Covers
✔ Building a Docker image in Cloud Build

Cloud Build automatically builds the image using your Dockerfile.

✔ Scanning the image with Trivy during CI

A Trivy scan step runs right after the build.
If any HIGH or CRITICAL vulnerabilities are found, the pipeline fails.

✔ Pushing only clean images to Artifact Registry

If the scan passes, Cloud Build pushes the clean image to:

us-central1-docker.pkg.dev/devfest-nepal/demo-repo/demo-app:latest

✔ Using a hardened Dockerfile

The Dockerfile uses:

Alpine (small base image)

Non-root user

Minimal packages
This ensures fewer vulnerabilities and a smaller attack surface.

✔ Using a mirrored Trivy image

To avoid Docker Hub rate-limits or pull failures, Trivy was mirrored into Artifact Registry so Cloud Build can pull it reliably.

⭐ High-Level Flow of the Demo

Developer pushes code / runs Cloud Build manually

Cloud Build:

Builds the Docker image

Runs Trivy scan on the built image

Fails if HIGH/CRITICAL vulnerabilities exist

Pushes the image only if scan passes

Image becomes available in Artifact Registry

(Optional) The image is run to verify everything works

⭐ Why This Matters (Shift-Left Security)

Vulnerabilities are caught early, inside CI, not after deployment.

Insecure images never reach production.

Developers get immediate feedback.

Security is baked into the pipeline instead of added later.

This is exactly what Shift-Left means — moving security closer to developers, earlier in the lifecycle.

⭐ Main Components Used
1. Cloud Build

Used as the CI system to build, scan, and push images.

2. Artifact Registry

Secure container registry where the final clean image is stored.

3. Trivy Scanner

Used to detect vulnerabilities inside the container image.

4. Cloud Shell

Everything is done via Cloud Shell — no local Docker/Trivy needed.

⭐ What the CI Pipeline Does (Plain English)

Build the image
Cloud Build runs docker build using your Dockerfile.

Scan the image
Trivy scans the just-built image.
The pipeline fails intentionally if vulnerabilities are found.

Push the image
If the scan passes, Cloud Build pushes the image to Artifact Registry.

Store a JSON scan report (if enabled)
Trivy’s report can also be uploaded for auditing.

⭐ What You Can Show in Your Demo Video

Show Cloud Shell workspace

Show Dockerfile (highlight non-root and Alpine base)

Show cloudbuild.yaml pipeline

Trigger Cloud Build

Watch the steps: build → scan → push

Verify the image in Artifact Registry

Optional: pull and run the image

Open Cloud Build History to show vulnerabilities or success logs

This creates a clean, structured, professional demo for the audience.

⭐ Next Steps (Optional Enhancements)

Add Cosign + Cloud KMS image signing

Enforce signatures via Binary Authorization

Add GitHub → Cloud Build triggers

Add SBOM (Software Bill of Materials) generation

Add Slack alerts on build failures

⭐ Conclusion

This demo shows an end-to-end example of shift-left container security on GCP:

Build early

Scan early

Block early

Deploy only clean, verified images

This approach improves developer experience, increases security, and reduces risk — all while seamlessly integrating into a standard CI/CD workflow.
