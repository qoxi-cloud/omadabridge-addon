ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.21
ARG UPSTREAM_VERSION=2.4.4
FROM rcooler/omada_exporter:${UPSTREAM_VERSION} AS upstream

FROM ${BUILD_FROM}
# static Go binary from the upstream multi-arch image (same arch as BUILD_FROM)
COPY --from=upstream /usr/bin/omada-exporter /usr/bin/omada-exporter
COPY run.sh /run.sh
RUN chmod a+x /run.sh /usr/bin/omada-exporter
HEALTHCHECK --interval=60s --timeout=5s --start-period=30s \
  CMD wget -q -T 5 -O /dev/null http://127.0.0.1:9202/healthz || exit 1
CMD ["/run.sh"]
