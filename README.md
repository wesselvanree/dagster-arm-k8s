# Dagster arm-based image for k8s

Dagster only builds docker images for `linux/amd64`, which cannot run on arm. This repo contains a dockerfile derived from their image such that it can be used in a helm deployment to k8s on arm machines.

> [!WARNING]
> Do not use containers from this registry in production systems.
>
> This repo is only meant as a temporary workaround until dagster supports multi-platform builds. Refer to this issue to view the latest status: https://github.com/dagster-io/dagster/issues/17167.
>
> Feel free to experiment with the images published in my container registry, but please do not rely on these images in production systems. I may delete them once dagster supports multi-platform builds. If you want to use this in your systems, you can fork this repo and build your own images.
