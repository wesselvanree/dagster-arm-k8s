FROM python:3.11-slim AS base

FROM base AS deps
RUN python -m venv .venv

# Install uv globally
RUN pip install -U uv

# Activate virtual env
ENV VIRTUAL_ENV=/.venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install deps in virtual env
ARG DAGSTER_VERSION
RUN uv pip install \
    dagster==${DAGSTER_VERSION} \
    # dagster-azure \
    dagster-postgres \
    dagster-k8s \
    # dagster-aws \
    dagster-celery[flower,redis,kubernetes] \
    dagster-celery-k8s \
    # dagster-gcp \
    dagster-graphql \
    dagster-webserver \
    grpcio==1.57.0  # https://github.com/grpc/grpc/issues/38327


FROM base AS runner
COPY --from=deps --chown=app:app /.venv /.venv
ENV PATH="/.venv/bin:$PATH"
