# gcp-kustomize-set-image-name

Google container registry (GCR) is a container image registry that supports docker & oci image formats. Registeries in GCR are named by the host and project ID. In a typical google cloud deployments, applications per env (production, staging, develop etc..) are deployed to multiple projects. If applications are running in GKE then we can use `kustomize` with `overlays` for deployments. 

Given the above context, kustomize provides a way to set image name which would allow you to use project specific images during deployments with no changes to deployment scripts/files.

As an example, I've created a test batch job that would run multiple containers with image names that have multi-level namespaces in gcr `project1`. By running `./set_image_name.sh`, `project1` would be replaced with `project2` irrespective of namespace seperations.