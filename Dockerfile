FROM alpine:latest
MAINTAINER pixboly <pixboly@gmail.com>

ARG VERSION=0.53.0

WORKDIR /

RUN apk --no-cache add tar curl && \
    curl -SLo frp.tar.gz \
        "https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz" && \
    tar -vxf frp.tar.gz && \
    ls -lah && \
    mv "frp_${VERSION}_linux_amd64" frp && \
    rm frp.tar.gz

WORKDIR /frp

RUN mkdir config log && \
    mv *.toml config/ && \
    ln -s config/frpc.toml ./frpc.toml && \
    ln -s config/frps.toml ./frps.toml

VOLUME /frp/config /frp/log

# [frps] vhost_http_port
# EXPOSE 80
# [frps] vhost_https_port
# EXPOSE 443
# [frps] export port range
# EXPOSE 2000-3000
# EXPOSE 2000-3000/udp
# bind_port
# EXPOSE 7000
# kcp_bind_port
# EXPOSE 7000/udp
# [frpc] admin_port
# EXPOSE 7400
# [frps] dashboard_port
# EXPOSE 7500

ENTRYPOINT ["/frp/frpc", "-c", "/frp/frpc.toml"]
