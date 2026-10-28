ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.21
ARG FORK_REPO=https://github.com/qoxi-cloud/omada_exporter
ARG FORK_REF=82c2be66cd2f3ca57ddbf08bf936c3ce98577141

# Build OmadaBridge from the qoxi-cloud fork (upstream RCooLeR/omada_exporter + our patches).
FROM golang:1.27-alpine AS builder
ARG FORK_REPO
ARG FORK_REF
RUN apk add --no-cache git ca-certificates
WORKDIR /src
RUN git clone --quiet "${FORK_REPO}" . && git checkout --quiet "${FORK_REF}"
WORKDIR /src/bridge
ENV CGO_ENABLED=0 GOFLAGS=-buildvcs=false
RUN go build -trimpath -ldflags="-s -w" -o /omada-exporter .

FROM ${BUILD_FROM}
COPY --from=builder /omada-exporter /usr/bin/omada-exporter
COPY run.sh /run.sh
RUN chmod a+x /run.sh /usr/bin/omada-exporter
HEALTHCHECK --interval=60s --timeout=5s --start-period=30s \
  CMD wget -q -T 5 -O /dev/null http://127.0.0.1:9202/healthz || exit 1
CMD ["/run.sh"]
