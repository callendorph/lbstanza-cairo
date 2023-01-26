FROM ghcr.io/callendorph/lbstanza:latest

ARG pkgs="libcairo2-dev"

USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends $pkgs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
USER stanza
