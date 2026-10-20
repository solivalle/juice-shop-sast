FROM debian:stable-slim

# Instalamos git y certificados de seguridad esenciales
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copiamos y extraemos el binario local de Bearer
COPY bearer.tar.gz /tmp/
RUN tar -xzf /tmp/bearer.tar.gz -C /usr/local/bin/ bearer && rm /tmp/bearer.tar.gz

WORKDIR /workspace

ENTRYPOINT ["bearer"]
CMD ["scan", "."]