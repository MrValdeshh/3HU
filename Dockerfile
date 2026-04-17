FROM gojolvl99/gojo-v2-core:latest

LABEL maintainer="MrValdez"
LABEL description="Cloud Run Xray WS (VLESS + Trojan + SS)"
LABEL version="3.0"

WORKDIR /etc/xray

COPY config.json /etc/xray/config.json

# Cloud Run uses ONLY one port
EXPOSE 8080

ENV XRAY_LOGLEVEL=warning

# ensure stability in container runtime
RUN apk add --no-cache ca-certificates || true

# run xray (more stable exec form)
ENTRYPOINT ["xray", "-config", "/etc/xray/config.json"]
