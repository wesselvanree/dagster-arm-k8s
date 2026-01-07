# Dagster arm-based image for k8s

Dagster only builds docker images for `linux/amd64`, which cannot run on arm. This repo contains a dockerfile derived from the official image such that it can be used in a helm deployment to k8s on arm machines, and has some small optimizations to reduce the image size. Note that some cloud-specific dagster packages are also omitted (AWS, Azure, GCP) to reduce image size.

> [!WARNING]
> Do not use containers from this registry in production systems.
>
> This repo is only meant as a temporary workaround until dagster supports multi-platform builds. Refer to this issue to view the latest status: https://github.com/dagster-io/dagster/issues/11841.
>
> Feel free to play around with the images published in my container registry, but please do not rely on these images in production systems. I may delete them eventually when dagster supports multi-platform builds. If you want to use this in your system, you can fork this repo and build your own images.
