FROM gojolvl99/gojo-v2-core:latest

LABEL maintainer="MrValdez"
LABEL description="Cloud Run Xray HTTP Upgrade (VLESS + Trojan + SS)"
LABEL version="3.0"

WORKDIR /etc/xray

COPY config.json /etc/xray/config.json

# Cloud Run uses ONLY one port
EXPOSE 8080

# reduce overhead
ENV XRAY_LOGLEVEL=warning

# run xray
ENTRYPOINT ["xray"]
CMD ["-config", "/etc/xray/config.json"]
